var express = require('express')
var app = express()

// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM classes ORDER BY id DESC',function(err, rows, fields) {

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
    })
})

// SHOW ADD Class FORM
app.get('/addclass', function(req, res, next){
    // render to views/user/add.ejs
    res.render('classes/addclass', {
        title: 'Add New Class',
        class_id: '',
        class_name:'',


    })
})

// ADD NEW USER POST ACTION
app.post('/addclass', function(req, res, next){
    req.assert('class_id','Class id is required').notEmpty()           //Validate id
    req.assert('class_name','Class Name is required').notEmpty()         //Validate class name

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
            conn.query('INSERT INTO classes SET ?', cl, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)

                    // render to views/user/add.ejs
                    res.render('classes/addclass', {
                        title: 'Add New class',
                        class_id: cl.class_id,
                        class_name: cl.class_name,
                    })
                } else {
                    req.flash('success', 'Data added successfully!')

                    // render to views/user/add.ejs
                    res.render('classes/addclass', {
                        title: 'Add New Class',
                        class_id: '',
                        class_name:'',

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
        res.render('classes/addclass', {
            title: 'Add New Class',
            class_id: req.body.class_id,
            class_name: req.body.class_name,
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
        conn.query('DELETE FROM classes WHERE id = ' + req.params.id, cl, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/class')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/class')
            }
        })
    })
})

module.exports = app
