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
        //req.flash('insertMessage', 'bad cnp');
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
