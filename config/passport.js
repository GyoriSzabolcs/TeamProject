var LocalStrategy = require("passport-local").Strategy;

var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

module.exports = function(passport) {
  passport.serializeUser(function(user, done) {
     done(null, user.id);
 });

  passport.deserializeUser(function(id, done){
    connection.query("SELECT * FROM users WHERE id = ? ", [id] ,
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
    connection.query("SELECT * FROM users WHERE username = ? ",
      [username], function(err, rows){
        if(err)
          return done(err);
        if(rows.length){
          return done(null, false, req.flash('signupMessage', 'That is already taken'));
        }else{
            connection.query("SELECT * FROM acceptedstudents WHERE universityid = ?", [universityid], function(err, rows){
              if(err)
                return done(err);
              if(rows.length){
                var newUserMysql = {
                  username : username,
                  password : bcrypt.hashSync(password, null, null),
                  cnp : cnp,
                  universityid : universityid
                };

                var insertQuery = "INSERT INTO users (username, password) values (?, ?)";
                var insertQueryStudents = "INSERT INTO students (username, password, cnp, universityid) values (?, ?, ?, ?)";

                connection.query(insertQueryStudents,[newUserMysql.username, newUserMysql.password, newUserMysql.cnp, newUserMysql.universityid],
                function(err, rows){
                  newUserMysql.id = rows.insertId;

                  return done(null, newUserMysql);
                });

                connection.query(insertQuery, [newUserMysql.username, newUserMysql.password],
                 function(err, rows){
                  newUserMysql.id = rows.insertId;

                  return done(null, newUserMysql);
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
  connection.query("SELECT * FROM users WHERE username = ? ", [username],
    function(err, rows){
      if(err)
       return done(err);
      if(!rows.length){
        return done(null, false, req.flash('loginMessage', 'No user found'));
      }
      if(!bcrypt.compareSync(password, rows[0].password)){
        return done(null, false, req.flash('loginMessage', 'Wrong pass nigga'));
      }
      return done(null, rows[0]);
    });
  })
);
};
