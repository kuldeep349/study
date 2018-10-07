var express = require('express')
var app = express()
var str_replace = require('str_replace');
session = require('express-session');
app.use(session({
    secret: '2C44-4D44-WppQ38S',
    resave: true,
    saveUninitialized: true
}));

var auth = function(req, res, next) {
  console.log(req.session)
  if (req.session && req.session.user === "kush" && req.session.admin)
    return next();
  else
      res.redirect('/admin/');
};
// Login endpoint
app.get('/login', function (req, res) {
  if (!req.query.username || !req.query.password) {
    req.flash('error','Wrong Username or Password')
      res.redirect('/admin');
  } else if(req.query.username === "kush" || req.query.password === "welcome") {
    req.session.user = "kush";
    req.session.admin = true;
      res.redirect('/admin/categories');
    //res.send("login success!");
  }else{
      req.flash('error','Wrong Username or Password')
      res.redirect('/admin');
  }
});
// Logout endpoint
app.get('/logout', function (req, res) {
  req.session.destroy();
    res.redirect('/');
});

// Get content endpoint
app.get('/content', auth, function (req, res) {
    res.send("You can only see this after you've logged in.");
});
app.get('/categories', auth, function(req, res, next){
    req.getConnection(function(error, conn) {
      conn.query('SELECT * FROM tbl_categories ORDER BY id DESC',function(err, rows, fields) {
          if (err) {
              req.flash('error', err)
              res.render('admin/category/category_list', {
                  title: 'Class List',
                  data: ''
              })
          } else {
              // render to views/user/list.ejs template file
              res.render('admin/category/category_list', {
                  title: 'Class List',
                  data: rows
              })
          }
      })
  })

})
app.get('/remove_category/', auth, function(req, res, next){
    req.getConnection(function(error, conn) {
    conn.query('delete FROM tbl_categories where id = '+req.query.id,function(err, rows, fields) {
      if (err) {
          req.flash('error', err.sqlMessage)
          res.redirect('../../admin/add-category');
      } else {
          req.flash('success', 'Category Deleted successfully!')
          res.redirect('admin/category/add-category');
      }
    })
})

})
app.get('/add-category', auth, function(req, res, next){
  req.getConnection(function(error, conn) {
      conn.query('SELECT * FROM tbl_categories ORDER BY id DESC',function(err, rows, fields) {
          if (err) {
              req.flash('error', err)
              res.render('admin/category/addcategory', {
                  title: 'Class List',
                  data: ''
              })
          } else {
              // render to views/user/list.ejs template file
              res.render('admin/category/addcategory', {
                  title: 'Class List',
                  data: rows
              })
          }
      })
  })

})

app.post('/add-category', auth, function(req, res, next){
  req.assert('category_name','Class Name is required').notEmpty()         //Validate class name
  var errors = req.validationErrors()
  if( !errors ) {
    var name = req.sanitize('category_name').escape().trim();
    var cl = {
        name: name,
        slug: str_replace(' ' , '_' , name)
      }
      req.getConnection(function(error, conn) {
          conn.query('INSERT INTO tbl_categories SET ?', cl, function(err, result) {
              if (err) {
                  req.flash('error', err)
                  res.render('admin/category/addcategory', {
                      title: 'Add New class',
                      category_name: cl.category_name
                  })
              } else {
                  req.flash('success', 'New Category added successfully!')
                res.redirect('/admin/add-category');
              }
          })
      })
  }
  else {   //Display errors to user
      var error_msg = ''
      errors.forEach(function(error) {
          error_msg += error.msg + '<br>'
      })
      req.flash('error', error_msg)

      /**
       * Using req.body.name
       * because req.param('name') is deprecated
       */
      res.render('classes/addclass', {
          title: 'Add New Class',
          class_id: req.body.class_id,
          class_name: req.body.class_name,
      })
  }

})


module.exports = app
