const express = require('express');
const app = express();
const mysql = require('mysql');
const dbconfig = require('./database');
const bodyParser = require('body-parser');
var flash= require('req-flash');

const conn = mysql.createConnection(dbconfig.connection);
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json);

conn.query('USE '+ dbconfig.database);
exports.dbRemove = function (req, res) { //CASCADING DELETE
    const fName = req.body.fName;
    const lName = req.body.lName;
    const code = req.body.facCode;
    if(fName.length < 3 || fName.length > 30 || !/^[a-zA-Z]+$/.test(fName)){
        console.log("bad first name");
        res.redirect("/removeStudent.ejs");
        return;
    } else if(lName.length < 3 || lName.length > 30 || !/^[a-zA-Z]+$/.test(lName)) {
        console.log("bad last name");
        res.redirect("/removeStudent.ejs");
        return;
    } else if(code.length != 5 || code.match(/^[A-Z0-9]+$/) ===null) { // CHECK THIS
        console.log("bad faculty code");
        res.redirect("/removeStudent.ejs");
        return;
    }

    conn.query("SELECT users.username, users.cnp FROM users, students WHERE users.cnp = students.CNP AND students.fName = ? AND students.lName = ? AND" +
        " students.facCode = ?", [fName, lName, code], (err,rows) => {
        console.log(rows.length);
        if (err) {
            console.error(err);
            throw err;
        } if(rows.length == 0){
            conn.query("DELETE FROM students WHERE students.fName = ? AND students.lName = ? AND" +
                " students.facCode = ?", [fName, lName, code], (err,rows) => {
                if(err){
                    console.error(err);
                    throw err;
                } else {
                    res.redirect("/removeStudent.ejs");
                }
            });
        } else {
            console.log("im here");
            var cnp = rows[0].cnp;
            var username = rows[0].username;
            conn.query("DELETE FROM students WHERE CNP = ?;", [cnp], (err, rows) =>{
                if(err){
                    console.error(err);
                    throw err;
                }
            });
            conn.query("DELETE FROM login WHERE username = ?", [username], (err, rows) =>{
                if(err){
                    console.error(err);
                    throw err;
                }
            });
            res.redirect("/removeStudent.ejs");
        }
    });

};

exports.dbInsert = function(req, res){
    const cnp = req.body.CNP;
    const fName = req.body.fName;
    const lName = req.body.lName;
    const faculty = req.body.fac;
    const code = req.body.facCode;
    if(cnp.length != 13 || !/^[0-9]+$/.test(cnp)){
        console.log("bad cnp");
        res.redirect("/addStudent.ejs");
        return;

    } else if(fName.length < 3 || fName.length > 30 || !/^[a-zA-Z]+$/.test(fName)){
        console.log("bad first name");
        res.redirect("/addStudent.ejs");
        return;
    } else if(lName.length < 3 || lName.length > 30 || !/^[a-zA-Z]+$/.test(lName)) {
        console.log("bad last name");
        res.redirect("/addStudent.ejs");
        return;
    } else if(faculty.length < 3 || faculty.length > 30 || !/^[a-zA-Z]+$/.test(faculty)) {
        console.log("bad faculty");
        res.redirect("/addStudent.ejs");
        return;
    } else if(code.length != 5 || code.match(/^[A-Z0-9]+$/i) === null) { // CHECK THIS
        console.log("bad faculty code");
        res.redirect("/addStudent.ejs");
        return;
    }
    conn.query("SELECT cnp, facCode FROM students WHERE cnp = ? AND facCode = ?", [cnp,code], (err, rows) => {
        if (err) {
            console.error(err);
            throw err;
        } else if(rows.length == 0){
            conn.query("INSERT INTO students (cnp, fName, lName, faculty, facCode) values (?, ?, ?, ?, ?)", [cnp, fName, lName, faculty, code], (err, rows) => {
                if (err) {
                    console.error(err);
                    throw err;
                } else {
                    res.redirect("/addStudent.ejs");
                }

            });
        } else{
            console.log("Entry exists");
            res.redirect("/addStudent.ejs");
        }
    });
};
exports.displayTable = function(req, res) {
    conn.query("SELECT students.*, users.username, users.enrollDate, " +
        "users.nextPaymentDate, users.nextPaymentSum, users.roomNumber, users.details FROM students LEFT JOIN users ON students.CNP = users.CNP",
        function (err, rows) {
        if(err)
            console.log("Error displaying from table: students");
        res.render('listStudents', {page_title:"List Students", data: rows});
    });
}

exports.getMessages = function (req, res) {
    conn.query("SELECT * FROM messages ORDER BY answered ASC, type", (err, rows) => {
        if(err)
            console.log("Error displaying from table: messages");
        res.render('manageRequests',{page_title:"Manage Requests", data:rows});
    })
}
exports.addResponse = function (req, res) {
    const text = req.body.resp;
    const type = req.body.type;
    const fName = req.body.fName;
    const lName = req.body.lName;
    const facCode = req.body.facCode;
    console.log(text + " " + fName + " " + lName + " " + facCode);
    conn.query("UPDATE messages SET response = ?, answered = 1 WHERE fName = ? AND lName = ? AND facCode = ? AND type = ?",
        [text, fName, lName, facCode, type], (err, rows) => {
        if(err){
            console.log("Error updating table: messages");
            console.log(err);
        }
        else
            res.redirect('/manageRequests.ejs');
    })
}
exports.removeMsg = function (req, res) {
    const type = req.body.type;
    const fName = req.body.fName;
    const lName = req.body.lName;
    const facCode = req.body.facCode;
    console.log( fName + " " + lName + " " + facCode);
    conn.query("DELETE FROM messages WHERE fName = ? AND lName = ? AND facCode = ? AND type = ?",
        [ fName, lName, facCode, type], (err, rows) => {
            if(err){
                console.log("Error removing from table: messages");
                console.log(err);
            }
            else
                res.redirect('/manageRequests.ejs');
        })
}
exports.getRooms = function (req, res) {
    conn.query("SELECT s.fName, s.lName, s.CNP, u.roomNumber, u.username, r.* FROM rooms r, students s, users u WHERE s.CNP = u.CNP AND u.roomNumber = r.ID ORDER BY r.ID ASC",
        function (err, rows) {
            var rooms = rows;
            if(err)
                console.log("Error displaying from table: students, users, rooms");
            conn.query("SELECT * FROM news", (err, rows) => {
                if(err)
                    console.log("Error displaying data from table: news");
                res.render('indexAdmin', {page_title:"Home", data1: rooms, data2: rows});
            })

        });
}
exports.changeRoom = function(req, res){
    const usr = req.body.username;
    const currC = req.body.currC;
    const oldR = req.body.oldroom;
    const newR = req.body.newroom;
    console.log(currC + " " + oldR + " " + newR + " " + usr);
    if(newR == oldR)
        console.log("User is already in this room");
    else if((newR > 0 && newR < 16) || (newR > 100 && newR < 116) || (newR > 200 && newR < 216)){
        conn.query("SELECT * FROM rooms WHERE ID = ?", [newR], (err, rows) => {
            //console.log(rows[0].currCapacity + " fjdshfohfshfod");
            if(err){
                console.log("Error retrieving from table: rooms");
                console.log(err);
                res.redirect('/indexAdmin.ejs');
            }
            else if(rows[0].currCapacity == rows[0].maxCapacity) {
                console.log("Selected room is full");
                res.redirect('/indexAdmin.ejs');
            } else {
                conn.query("UPDATE rooms SET currCapacity = ? WHERE ID = ?;",
                    [rows[0].currCapacity+1, newR], (err, rows) => {
                        if(err){
                            console.log("Error updating tables: rooms 1");
                            console.log(err);
                            res.redirect('/indexAdmin.ejs');
                        } else {
                            console.log("Increment successful");
                        }
                    })
                conn.query(" UPDATE users SET roomNumber = ? WHERE username = ?;",
                    [ newR, usr], (err, rows) => {
                        if(err){
                            console.log("Error updating tables: users");
                            console.log(err);
                            res.redirect('/indexAdmin.ejs');
                        } else {
                            console.log("Modify successful");
                        }
                    })
                conn.query("UPDATE rooms SET currCapacity = ? WHERE ID = ?;",
                    [ currC-1, oldR], (err, rows) => {
                        if(err){
                            console.log("Error updating tables: rooms ");
                            console.log(err);
                            res.redirect('/indexAdmin.ejs');
                        } else {
                            console.log("Decrement successful");

                        }
                    })
                res.redirect('/indexAdmin.ejs');
            }
        })
    } else{
        console.log("Room doesn't exist");
        res.redirect('/indexAdmin.ejs');
    }
}
exports.postNews = function (req, res) {
    const msg = req.body.news;
    conn.query("INSERT INTO news VALUES(NULL, 'admin', ?, SYSDATE())", [msg], (err) => {
        if(err){
            console.log("Error retrieving from table: rooms");
            console.log(err);
            res.redirect('/indexAdmin.ejs');
        } else
        {
            console.log("Post successful");
            res.redirect('/indexAdmin.ejs');
        }
    })
}
exports.delNews = function (req, res) {
    const id = req.body.ID;
    conn.query("DELETE FROM news WHERE id = ?", [id], (err) => {
        if(err){
            console.log("Error deleting from table: news");
            console.log(err);
            res.redirect('/indexAdmin.ejs');
        } else
        {
            console.log("Delete successful");
            res.redirect('/indexAdmin.ejs');
        }
    })
}