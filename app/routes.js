const dbstuff = require('../config/adminEntry.js');
const profileInformation = require('../config/getProfile.js');
const news = require('../config/news.js');
const mesajeTrimitere = require('../config/mesajeTrimitere.js');

module.exports = function (app, passport) {

    app.get('/', function (req, res) {
        res.render('index.ejs');
    });

    app.get('/login', function (req, res) {
        res.render('login.ejs', {message: req.flash('loginMessage')});
    });

    app.post('/login', passport.authenticate('local-login', {
            successRedirect: '/profile',
            failureRedirect: '/login',
            failureFlash: true
        }),
        function (req, res) {
            if (req.body.remember) {
                req.session.cookie.maxAge = 1000 * 60 * 3;
            } else {
                req.session.cookie.expires = false;
            }
            res.redirect('/');
        });

    app.get('/signup', function (req, res) {
        res.render('signup.ejs', {message: req.flash('signupMessage')});
    });

    app.post('/signup', passport.authenticate('local-signup', {
        successRedirect: '/profile',
        failureRedirect: '/signup',
        failureFlash: true
    }));

    app.use(function(req, res, next){
      res.locals.user = req.user;
      next();
    });

    // app.get('/profile', isLoggedIn, function (req, res) {
    //     res.render('profile.ejs', {
    //         user: req.user
    //     });
    // });

    app.get('/logout', function (req, res) {
        req.logout();
        res.redirect('/');
    });

    //app.get('/profile',{a: a, b: profileInformation.profileInfoSelf });
    app.get('/profile', profileInformation.profileInfo);

    app.get('/profile', isLoggedIn, function(req, res){
      res.render('profile.ejs', {a: a, b: profileInformation.profileInfoSelf });
    });
    //app.get('/profile', profileInformation.profileInfo);
    app.get('/news', isLoggedIn, news.display);

    app.get('/news', isLoggedIn, function (req, res) {
        res.render('news.ejs');
    });

    app.post('/sendMessage', isLoggedIn, mesajeTrimitere.messageInsert);

    app.get('/sendMessage', isLoggedIn, function (req, res) {
        res.render('sendMessage.ejs');
    });
    /*###################################*/
    app.get('/addStudent.ejs', function (req, res) {
        res.render('addStudent.ejs');
    });
    app.post('/addStudent', dbstuff.dbInsert);
    app.get('/removeStudent.ejs', function (req, res) {
        res.render('removeStudent.ejs');
    });
    app.post('/removeStudent', dbstuff.dbRemove);

    app.get('/indexAdmin.ejs', function (req, res) {
        res.render('indexAdmin.ejs');
    });
    app.get('/listStudents.ejs', dbstuff.displayTable);

}

function isLoggedIn(req, res, next) {
    if (req.isAuthenticated())
        return next();

    res.redirect('/');
}
