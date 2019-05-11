var LocalStrategy = require("passport-local").Strategy;

var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);
var moment = require('moment');
var registerDate = moment().format('YYYY-MM-DD');
var nextPaymentDate = moment().add(1, 'months').format('YYYY-MM-DD');

global.roomNumber = 0;

// Register Fields:
// -CNP;
// -username;
// -enrollDate;
// -nextPaymentDate;
// -nextPaymentSum;
// -roomNumber;
// -detail;
// -gender; -req

module.exports = function(passport) {
  passport.serializeUser(function(user, done) {
     done(null, user.username);
 });

  passport.deserializeUser(function(username, done){
    connection.query("SELECT * FROM login WHERE username = ? ", [username] ,
      function(err, rows){
        done(null,rows[0]);
      });
  });




  passport.use(
    'local-signup',
    new LocalStrategy({
      usernameField : 'username',
      passwordField : 'password',
      passReqToCallback : true
    },
  function(req, username, password, done){
    var universityid = req.body.universityid;
    var cnp = req.body.cnp;
    var gender = req.body.gender;

    connection.query("SELECT * FROM users WHERE username = ? ",
      [username], function(err, rows){
        if(err)
          return done(err);
        if(rows.length){
          return done(null, false, req.flash('signupMessage', 'That is already taken'));
        }else{
            connection.query("SELECT * FROM students WHERE facCode = ?", [universityid], function(err, rows){
              if(err)
                return done(err);
              if(rows.length){
                var newUserMysql = {
                  username : username,
                  password : bcrypt.hashSync(password, null, null),
                  cnp : cnp,
                  universityid : universityid,
                  gender : gender
                };

                function getRoomNumber(gender, callback){
                    connection.query("SELECT * FROM rooms WHERE currCapacity < maxCapacity AND sex='" + gender + "' ORDER BY ID", function (err, result) {
                      if (err) callback(null,err);
                      connection.query("UPDATE rooms SET currCapacity = currCapacity + 1 WHERE ID = " + result[0].ID);
                      callback(null,result[0].ID);

                    });

                }

                getRoomNumber('M', function(err,data){
                  if (err) {
                    console.log("ERROR : ",err);
                  } else {
                      console.log(roomNumber);
                       roomNumber = data;

                console.log(roomNumber);

                var insertQuery = "INSERT INTO login (username, pass) values (?, ?)";
                var insertQueryStudents = "INSERT INTO users (CNP, username, enrollDate, nextPaymentDate, nextPaymentSum, roomNumber) values (?, ?, ?, ?, ?, ?)";

                connection.query(insertQuery, [newUserMysql.username, newUserMysql.password],
                 function(err, rows){
                  return done(null, newUserMysql);
                 });


                connection.query(insertQueryStudents,[newUserMysql.cnp, newUserMysql.username, registerDate, nextPaymentDate, 200, roomNumber],
                function(err, rows){
                  return done(null, newUserMysql);
                });

}
});
              }else {
                return done(null, false, req.flash('signupMessage', 'This student id is not accepted' + username + password + cnp + universityid));
              }


            });
         }
        });
       })
      );

passport.use(
  'local-login',
  new LocalStrategy({
    usernameField : 'username',
    passwordField : 'password',
    passReqToCallback : true
  },
function(req, username, password, done){
  user = req.body.username;
  pass = req.body.password;
  connection.query("SELECT * FROM login WHERE username = ? ", [user],
    function(err, rows){
      if(err)
       return done(err);
      if(!rows.length){
        return done(null, false, req.flash('loginMessage', 'No user found'));
      }
      if(!bcrypt.compareSync(pass, rows[0].pass)){
        return done(null, false, req.flash('loginMessage', 'Wrong pass nigga'));
      }
      return done(null, rows[0]);
    });
  })
);
};
