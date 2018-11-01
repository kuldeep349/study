
var express = require('express')
var app = express()
session = require('express-session');
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
   
    var data  = {
        boards : JSON.parse(boards),
         classes :JSON.parse(classes),
         subjects : JSON.parse(subjects)
    }
    console.log(data)

        res.render('site/index', {
            title: 'Add content',
            data: data
        }) 
})


app.get('/class-wise',async function(req, res, next) {
    var topic
    var subject
    var mysubject;
    var current_subs = req.query.id;
    var query = 'SELECT * FROM tbl_subjects GROUP BY id ASC';
    mysubject = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_topic where class_id = '+req.query.id;
    topic = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_class GROUP BY class_name ORDER BY id ASC';
    subject = await database.query(query, [] );
    var data  = {
        mysubject:  JSON.parse(mysubject),
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
    var myclass
    var education
    //var current_drop = req.session.myclass;
    var current_subs = req.query.id;
    // var query = 'SELECT * FROM tbl_categories ORDER BY id ASC';
    // education = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_class ORDER BY id ASC';
    myclass = await database.query(query, [] );
    
    var query = 'SELECT * FROM tbl_subjects GROUP BY subject_name ORDER BY id ASC';
    subject = await database.query(query, [] );
    if(req.session.myclass){
        var query = 'SELECT * FROM tbl_topic where subject_id = '+req.query.id + ' and class_id = ' + req.session.myclass;
    topic = await database.query(query, [] );
        var topics =  JSON.parse(topic)
        var bigclass = ''
    }else{
        var bigclass =JSON.parse(myclass)
        var topics = ''
    }
    var data  = {
       
        // education:  JSON.parse(education),
        myclass:  JSON.parse(myclass),
        bigclass : bigclass,
        subject: JSON.parse(subject),
        topics : topics,
        current_drop:  req.session.myclass,
        current_subs : current_subs
    }
    res.render('site/subject-wise', {
        title: 'Class List',
        data: data
    })
})

app.get('/selectclass', async function(req, res, next) {
    req.session.myclass =  req.query.id;
    var query = 'SELECT * FROM  tbl_topic where class_id = ' +req.query.id +  '  && subject_id=' + req.query.sid;
    console.log(query);
     results = await database.query(query, [] );
       // res.writeHead(200, {'Content-Type': 'application/json'});
        res.send(results);


})


app.get('/selectdesc', async function(req, res, next) {
    var query = 'SELECT description FROM  tbl_topic where id = '+req.query.id;
     results = await database.query(query, [] );
       // res.writeHead(200, {'Content-Type': 'application/json'});
        res.send(results);


})

app.get('/selectsubject', async function(req, res, next) {
    var query = 'SELECT * FROM  tbl_topic where subject_id = '+req.query.id + '&& class_id=' + req.query.sid;
     results = await database.query(query, [] );
       // res.writeHead(200, {'Content-Type': 'application/json'});
        res.send(results);


})



app.get('/board-material',async function(req, res, next) {
    var board
    var myboards
    var current_subs = req.query.id;
    var query = 'SELECT * FROM tbl_class ORDER BY id ASC';
    board = await database.query(query, [] );
    var query = 'SELECT * FROM tbl_boards';
    myboards = await database.query(query, [] );
    var data  = {
        board: JSON.parse(board),
        myboards : JSON.parse(myboards),
        current_subs : current_subs
    }
    res.render('site/board-material', {
        title: 'Class List',
        data: data
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
