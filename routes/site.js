var express = require('express')
var app = express()

// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    res.render('site/index', {
        title: 'Class List',
        data: 'this is site index'
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
module.exports = app
