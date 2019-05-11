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
    const msg = req.body.msg;
    const type = req.body.types;
    console.log(type);
    var returnedInfo = {

    };
    connection.query("SELECT * FROM users WHERE username = '" + user +"'",
        function (err, rows) {
        if(err)
            console.log("Error displaying from table: students");
            console.log(rows);
            connection.query("SELECT * FROM students WHERE CNP = " + rows[0].CNP,
              function (err, rows) {
                if(err)
                  console.log("Error displaying from table: students2");
                returnedInfo.selfName = rows;
                console.log(returnedInfo.self);


    connection.query("SELECT facCode FROM students WHERE facCode = ?", [returnedInfo.selfName[0].facCode], (err, rows) => {
        if (err) {
            console.error(err);
            throw err;
        } else if(rows.length > 0){
            connection.query("INSERT INTO messages (fName, lName, facCode, type, msg) values (?, ?, ?, ?, ?)", [returnedInfo.selfName[0].fName, returnedInfo.selfName[0].lName, returnedInfo.selfName[0].facCode, type, msg], (err, rows) => {
                if (err) {
                    console.error(err);
                    throw err;
                } else {
                    res.redirect("/sendMessage");
                }

            });
        } else{
            console.log("invalid student id");
            res.redirect("/sendMessage");
        }
    });
  });
});
};
