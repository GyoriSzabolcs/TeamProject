var moment = require('moment');
const express = require('express');
const app = express();
var mysql = require('mysql');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
const bodyParser = require('body-parser');
var flash= require('req-flash');

connection.query('USE ' + dbconfig.database);

exports.display = function(req, res){
  connection.query("SELECT * FROM news ORDER BY id DESC",
      function (err, rows) {
      if(err)
          console.log("Error displaying from table: students");
      res.render('news', {data: rows});
  });

}
