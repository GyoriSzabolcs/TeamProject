var moment = require('moment');
const express = require('express');
const app = express();
var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
const bodyParser = require('body-parser');
var flash= require('req-flash');

connection.query('USE ' + dbconfig.database);

exports.profileInfo = function(req, res){
  //console.log(user);
  var returnedInfo = {

  }

  connection.query("SELECT * FROM users WHERE username = '" + user +"'",
      function (err, rows) {
      if(err)
          console.log("Error displaying from table: students");
      //console.log(rows[0].roomNumber);
      returnedInfo.self = rows;
      connection.query("SELECT * FROM students WHERE CNP = " + rows[0].CNP,
          function (err, rows) {
          if(err)
              console.log("Error displaying from table: students2");

              returnedInfo.selfName = rows;
              console.log(returnedInfo.self);

      });
      connection.query("SELECT * FROM users WHERE roomNumber = " + rows[0].roomNumber,
          function (err, rows) {
          if(err)
              console.log("Error displaying from table: students2");
              connection.query("SELECT * FROM students WHERE CNP = " + rows[0].CNP + " OR CNP = "+ rows[1].CNP +" OR CNP = "+ rows[2].CNP +" OR CNP = "+ rows[3].CNP,
                  function (err, rows) {
                  if(err)
                      console.log("Error displaying from table: students2");
                      //console.log(rows)
                      returnedInfo.mates = rows;
                      console.log(returnedInfo.self);
                  res.render('profile', {data: returnedInfo});
              });
      });

  });
}

exports.profileInfoSelf = function(req, res){
  console.log(user);
  connection.query("SELECT * FROM users WHERE username = '" + user +"'",
      function (err, rows) {
      if(err)
          console.log("Error displaying from table: students");
      console.log(rows);
      res.render('profile', {data2: rows});
  });
}
