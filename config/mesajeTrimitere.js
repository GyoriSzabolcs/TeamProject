var moment = require('moment');
const express = require('express');
const app = express();
var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
const bodyParser = require('body-parser');
var flash= require('req-flash');

connection.query('USE ' + dbconfig.database);

//FIELDS: ID, fName, lName, facCode, msg

exports.messageInsert = function(req, res){
    const fName = req.body.fName;
    const lName = req.body.lName;
    const facCode = req.body.facCode;
    const msg = req.body.msg;
    // if(cnp.length != 13 || !/^[0-9]+$/.test(cnp)){
    //     console.log("bad cnp");
    //     //req.flash('insertMessage', 'bad cnp');
    //     res.redirect("/addStudent.ejs");
    //     return;
    //
    // } else if(fName.length < 3 || fName.length > 30 || !/^[a-zA-Z]+$/.test(fName)){
    //     console.log("bad first name");
    //     res.redirect("/addStudent.ejs");
    //     return;
    // } else if(lName.length < 3 || lName.length > 30 || !/^[a-zA-Z]+$/.test(lName)) {
    //     console.log("bad last name");
    //     res.redirect("/addStudent.ejs");
    //     return;
    // } else if(facCode.length != 5 || code.match(/^[A-Z0-9]+$/i) === null) { // CHECK THIS
    //     console.log("bad faculty code");
    //     res.redirect("/addStudent.ejs");
    //     return;
    // }
    connection.query("SELECT facCode FROM students WHERE facCode = ?", [facCode], (err, rows) => {
        if (err) {
            console.error(err);
            throw err;
        } else if(rows.length > 0){
            connection.query("INSERT INTO messages (fName, lName, facCode, msg) values (?, ?, ?, ?)", [fName, lName, facCode, msg], (err, rows) => {
                if (err) {
                    console.error(err);
                    throw err;
                } else {
                    res.redirect("/sendMessage.ejs");
                }

            });
        } else{
            console.log("invalid student id");
            res.redirect("/sendMessage.ejs");
        }
    });
};
