const dbstuff = require('../config/adminEntry.js');

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

    app.get('/profile', isLoggedIn, function (req, res) {
        res.render('profile.ejs', {
            user: req.user
        });
    });

    app.get('/logout', function (req, res) {
        req.logout();
        res.redirect('/');
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

   /* app.get('/indexAdmin.ejs', function (req, res) {
        res.render('indexAdmin.ejs');
    });*/
    app.get('/listStudents.ejs', dbstuff.displayTable);
    app.get('/manageRequests.ejs', dbstuff.getMessages);
    app.post('/manageRequests', dbstuff.addResponse);
    app.post('/removeMsg', dbstuff.removeMsg);
    app.get('/indexAdmin.ejs', dbstuff.getRooms);
    app.post('/delNews', dbstuff.delNews);
    app.post('/changeRoom', dbstuff.changeRoom);
    app.post('/postNews', dbstuff.postNews);
}

function isLoggedIn(req, res, next) {
    if (req.isAuthenticated())
        return next();

    res.redirect('/');
}
