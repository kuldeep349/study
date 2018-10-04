
var express = require('express')
var app = express()

// app.get('/reb', function(req, res) {
//     // render to views/index.ejs template file
//     //res.render('index', {title: 'Application R.E.B'})
//     req.getConnection(function(error, conn) {
//         conn.query('SELECT * FROM classes ORDER BY id DESC',function(err, rows, fields) {
//             if (err) {
//                 req.flash('error', err)
//                 res.render('index', {
//                     title: 'Class List',
//                     data: ''
//                 })
//             } else {
//                 res.render('index', {
//                     title: 'Class List',
//                     data: rows
//                 })
//             }
//         })
//     })
//
// })

app.get('/', function(req, res, next) {
    res.render('index', {
        title: 'Class List',
        data: ''
    })
})
app.get('/class-wise', function(req, res, next) {
    res.render('site/class-wise', {
        title: 'Class List',
        data: 'this is site index'
    })
})
app.get('/subject-wise', function(req, res, next) {
    res.render('site/subject-wise', {
        title: 'Class List',
        data: 'this is site index'
    })
})
app.get('/board-material', function(req, res, next) {
    res.render('site/board-material', {
        title: 'Class List',
        data: 'this is site index'
    })
})
app.get('/entranc-exam', function(req, res, next) {
    res.render('site/entranc-exam', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/career-guidance', function(req, res, next) {
    res.render('site/career-guidance', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/cbse-board', function(req, res, next) {
    res.render('site/cbse-board', {
        title: 'Class List',
        data: 'this is site index'
    })
})
// app.get('/career-guidance', function(req, res, next) {
//     res.render('site/career-guidance', {
//         title: 'Class List',
//         data: 'this is site index'
//     })
// })



app.get('/subject-topic', function(req, res, next) {
    res.render('site/subject-topic', {
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
