
var express = require('express')
var app = express()
var await = require('await')
const {database} = require('../db.js')
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

app.get('/',  function(req, res, next) {

    req.getConnection(function(error, conn) {
      var sub_cat; sub_cats = []
      conn.query('SELECT id,name FROM tbl_categories ',function(err, rows, fields) {
        var categories = rows;
        // for (x in rows) {
        var x = 0;
          while (x < 3) {
           //sub_cat = await
           var sql = 'select id,name from tbl_sub_categories where  category_id  = '+ rows[x].id;
           sub_cat = await (database.query (sql, [], true))

          categories[x].sub = sub_cat
          console.log(sub_cat)
          x++;
        }
        // console.log(categories)
        res.render('index', {
            title: 'Class List',
            data: categories
        })
    })
  })

})


const getCategories = async function (cat_id , req) {
    //categories[x].sub = [x , 'a', 'b']

}
app.get('/addtopic', function(req, res, next) {
    res.render('admin/topic/addtopic', {
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

app.get('/blog-discussion', function(req, res, next) {
    res.render('site/blog-discussion', {
        title: 'Class List',
        data: 'this is site index'
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

app.get('/test_your_self', function(req, res, next) {
    res.render('site/test_your_self', {
        title: 'Class List',
        data: 'this is site index'
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
