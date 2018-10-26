
var express = require('express')
var app = express()

const {database} = require('../db.js')
app.get('/',async function(req, res, next) {
    var subjects ;
    var classes;
    var boards;
    var query = 'SELECT * FROM tbl_subjects GROUP BY subject_name ORDER BY id ASC';
    subjects = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_class GROUP BY class_name ORDER BY id ASC';
    classes = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_boards GROUP BY board_name ORDER BY id ASC';
    boards = await database.query(query, [] );
    // var data  = {
    //     boards : JSON.parse(JSON.stringify(boards)),
    //     classes : JSON.parse(JSON.stringify(classes)),
    //     subjects : JSON.parse(JSON.stringify(subjects))
    // }
    var data  = {
        boards : JSON.parse(boards),
         classes :JSON.parse(classes),
         subjects : JSON.parse(subjects)
    }
    console.log(data)

        res.render('index', {
            title: 'Add content',
            data: data
        }) 
})
// app.get('/',async function(req, res, next) {

//     var query = 'SELECT * FROM tbl_class GROUP BY class_name';
//     results = await database.query(query, [] );
//         res.render('site/index', {
//             title: 'Add content',
//             data: JSON.parse(results)
//         }) 
// })
app.get('/class-wise',async function(req, res, next) {
    var topic
    var subject
    var current_subs = req.query.id;
    var query = 'SELECT * FROM tbl_topic where class_id = '+req.query.id;
    topic = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_class GROUP BY class_name ORDER BY id ASC';
    subject = await database.query(query, [] );
    var data  = {
        subject: JSON.parse(subject),
        topic : JSON.parse(topic),
        current_subs : current_subs
    }
    res.render('site/class-wise', {
        title: 'Class List',
        data: data
    })
})
app.get('/subject-wise',async function(req, res, next) {
    var topic
    var subject
    var current_subs = req.query.id;
    var query = 'SELECT * FROM tbl_topic where subject_id = '+req.query.id;
    topic = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_subjects GROUP BY subject_name ORDER BY id ASC';
    subject = await database.query(query, [] );
    var data  = {
        subject: JSON.parse(subject),
        topic : JSON.parse(topic),
        current_subs : current_subs
    }
    res.render('site/subject-wise', {
        title: 'Class List',
        data: data
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

app.get('/blog-discussion',async function(req, res, next) {

    var subjects ;
    var classes;
    var boards;
    var query = 'SELECT * FROM tbl_subjects GROUP BY subject_name ORDER BY id ASC';
    subjects = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_class GROUP BY class_name ORDER BY id ASC';
    classes = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_boards GROUP BY board_name ORDER BY id ASC';
    boards = await database.query(query, [] );
    var data  = {
        boards : JSON.parse(boards),
        classes : JSON.parse(classes),
        subjects : JSON.parse(subjects)
    }
        res.render('site/blog-discussion', {
            title: 'Add content',
            data: data
        }) 
    
})

app.get('/blog_subjectwise', function(req, res, next) {
    res.render('site/blog_subjectwise', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/blog_subject_topic', function(req, res, next) {
    res.render('site/blog_subject_topic', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/test_your_self',async function(req, res, next) {

    var subjects ;
    var classes;
    var boards;
    var query = 'SELECT * FROM tbl_subjects GROUP BY subject_name ORDER BY id ASC';
    subjects = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_class GROUP BY class_name ORDER BY id ASC';
    classes = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_boards GROUP BY board_name ORDER BY id ASC';
    boards = await database.query(query, [] );
    var data  = {
        boards : JSON.parse(boards),
        classes : JSON.parse(classes),
        subjects : JSON.parse(subjects)
    }
        res.render('site/test_your_self', {
            title: 'Add content',
            data: data
        }) 
   
})

app.get('/entrance_exam', function(req, res, next) {
    res.render('site/entrance_exam', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/engineering_entrancexam', function(req, res, next) {
    res.render('site/engineering_entrancexam', {
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

app.get('/career_after10', function(req, res, next) {
    res.render('site/career_after10', {
        title: 'Class List',
        data: 'this is site index'
    })
})


app.get('/subject_subcategory', function(req, res, next) {
    res.render('site/subject_subcategory', {
        title: 'Class List',
        data: 'this is site index'
    })
})
app.get('/subject_topic', function(req, res, next) {
    res.render('site/subject_topic', {
        title: 'Class List',
        data: 'this is site index'
    })
})



app.get('/subject-topic', function(req, res, next) {
    res.render('site/subject-topic', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/test_yourself_subjectwise', function(req, res, next) {
    res.render('site/test_yourself_subjectwise', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/test_yourself_subcategory', function(req, res, next) {
    res.render('site/test_yourself_subcategory', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/quiz_test', function(req, res, next) {
    res.render('site/quiz_test', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/admin/', function(req, res, next) {
    res.render('admin/index', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('/admin/dashboard', function(req, res, next) {
    res.render('admin/dashboard/index', {
        title: 'Class List',
        data: 'this is site index'
    })
})

app.get('dashboard/', function(req, res, next) {
    res.render('admin/dashboard/add-book', {
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
