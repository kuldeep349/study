
var express = require('express')
var app = express()

app.get('/reb', function(req, res) {
    // render to views/index.ejs template file
    //res.render('index', {title: 'Application R.E.B'})
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM classes ORDER BY id DESC',function(err, rows, fields) {
            if (err) {
                req.flash('error', err)
                res.render('index', {
                    title: 'Class List',
                    data: ''
                })
            } else {
                res.render('index', {
                    title: 'Class List',
                    data: rows
                })
            }
        })
    })

})

app.get('/reb/class-wise', function(req, res, next) {
    res.render('site/class-wise', {
        title: 'Class List',
        data: 'this is site index'
    })
})
app.get('/reb/subject-wise', function(req, res, next) {
    res.render('site/subject-wise', {
        title: 'Class List',
        data: 'this is site index'
    })
})


/**
 * We assign app object to module.exports
 *
 * module.exports exposes the app object as a module
 *
 * module.exports should be used to return the object
 * when this file is required in another module like app.js
 */
module.exports = app;
