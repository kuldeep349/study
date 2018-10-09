var express = require('express')
var app = express()

// SHOW LIST OF classes
app.get('/class-list', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('select tbl_class.id , tbl_class.class_name ,tbl_boards.board_name from tbl_class INNER JOIN tbl_boards on tbl_class.board_id = tbl_boards.id',function(err, rows, fields) {

            if (err) {
                req.flash('error', err)
                res.render('admin/classes/listclass', {
                    title: 'Class List',
                    data: ''
                })
            } else {
                // render to views/user/list.ejs template file
                res.render('admin/classes/listclass', {
                    title: 'Class List',
                    data: rows
                })
            }
        })
    })
})

// SHOW ADD Class FORM
app.get('/addclass', function(req, res, next){
  req.getConnection(function(error, conn) {
      conn.query('SELECT * FROM tbl_boards ORDER BY id DESC',function(err, rows, fields) {
          //if(err) throw err
          console.log(rows)
          if (err) {
              req.flash('error', err)
              res.render('admin/classes/addclass', {
                  title: 'Add New Class',
                  class_id: '',
                  class_name:'',
              })
          } else {
            res.render('admin/classes/addclass', {
                title: 'Add New Class',
                class_id: '',
                data:rows,
            })
          }
      })
  })
    // render to views/user/add.ejs

})
app.get('/show_class', function(req, res, next) {
    req.getConnection(function(error, conn) {
      var query = 'SELECT * FROM tbl_class where board_id = '+req.query.id;
        conn.query(query,function(err, rows, fields) {
          res.writeHead(200, {'Content-Type': 'application/json'});
            res.end(JSON.stringify(rows));
        })
    })
})
// ADD NEW USER POST ACTION
app.post('/addclass', function(req, res, next){
    req.assert('board_id','Board is required').notEmpty()           //Validate id
    req.assert('class_name','Class Name is required').notEmpty()         //Validate class name
    var errors = req.validationErrors()
    if( !errors ) {
      var cl = {
            board_id: req.sanitize('board_id').escape().trim(),
            class_name: req.sanitize('class_name').escape().trim(),
        }

        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO tbl_class SET ?', cl, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    res.render('admin/classes/addclass', {
                        title: 'Add New Class',
                        class_id: '',
                        class_name:'',
                  })
                } else {
                    req.flash('success', 'Data added successfully!')
                      res.redirect('/admin/class/class-list')
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

         res.render('admin/classes/addclass', {
             title: 'Add New Class',
             class_id: '',
             class_name:'',
         })
    }
})

// SHOW EDIT USER FORM
app.get('/editclass/(:id)', function(req, res, next){
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM classes WHERE id = ' + req.params.id, function(err, rows, fields) {
            if(err) throw err

            // if class not found
            if (rows.length <= 0) {
                req.flash('error', 'Class not found with id = ' + req.params.id)
                res.redirect('/class')
            }
            else { // if class found
                // render to views/classes/editclass.ejs template file
                res.render('classes/editclass', {
                    title: 'Edit Class',
                    //data: rows[0],
                    id: rows[0].id,
                    class_id: rows[0].class_id,
                    class_name: rows[0].class_name,
                })
            }
        })
    })
})

// EDIT classes POST ACTION
app.put('/editclass/:id', function(req, res, next) {
    req.assert('class_id', 'Class-ID is required').notEmpty()           //Validate name
    req.assert('class_name', 'Class-Name is required').notEmpty()

    var errors = req.validationErrors()

    if( !errors ) {   //No errors were found.  Passed Validation!

        /********************************************
         * Express-validator module

        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';

        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var cl = {
            class_id: req.sanitize('class_id').escape().trim(),
            class_name: req.sanitize('class_name').escape().trim(),


        }

        req.getConnection(function(error, conn) {
            console.log(req.params);

            conn.query('UPDATE classes SET ? WHERE id = ' + req.params.id, cl, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)

                    // render to views/user/add.ejs
                    res.render('classes/editclass', {
                        title: 'Edit class',
                        class_id: req.body.class_id,
                        class_name: req.body.class_name,
                    })
                } else {
                    req.flash('success', 'Data updated successfully!')

                    conn.query('SELECT * FROM classes ORDER BY id DESC',function(err, rows, fields) {
                        //if(err) throw err
                        if (err) {
                            req.flash('error', err)
                            res.render('classes/listclass', {
                                title: 'Class List',
                                data: ''
                            })
                        } else {
                            // render to views/user/list.ejs template file
                            res.render('classes/listclass', {
                                title: 'Class List',
                                data: rows
                            })
                        }
                    })
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
        res.render('classes/editclass', {
            title: 'Edit Class',

            class_id: req.body.class_id,
            class_name: req.body.class_name,
        })
    }
})

// DELETE Class
app.delete('/delete/(:id)', function(req, res, next) {
    var cl = { id: req.params.id }

    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM tbl_class WHERE id = ' + req.params.id, cl, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/admin/class/class-list')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/admin/class/class-list')
            }
        })
    })
})

module.exports = app
