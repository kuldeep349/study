var express = require('express')
var app = express()

 
// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM tests ORDER BY id DESC',function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.render('exams/examlist', {
                    title: 'Exam List', 
                    data: ''
                })
            } else {
                // render to views/user/list.ejs template file
                res.render('exams/examlist', {
                    title: 'Exam List', 
                    data: rows
                })
            }
        })
    })
})
 
// SHOW ADD Class FORM
app.get('/addexam', function(req, res, next){    
    // render to views/user/add.ejs
    res.render('exams/addexam', {
        title: 'Add Exam',
        exam_id:'',
        exam_name: '',
        field:'',
        stream:'',
    })
})
 
// ADD NEW Content POST ACTION
app.post('/addexam', function(req, res, next){    
    req.assert('exam_id', 'Exam ID is required').notEmpty()           
    req.assert('exam_name', 'Exam Name is required').notEmpty()
    req.assert('field', 'Field is required').notEmpty()
    req.assert('stream', 'Stream is required').notEmpty()           
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var exm = {
            exam_id: req.sanitize('exam_id').escape().trim(),         
            exam_name: req.sanitize('exam_name').escape().trim(),
            field: req.sanitize('field').escape().trim(),
            stream: req.sanitize('stream').escape().trim(),
            
        }
        
        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO tests SET ?', exm, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('exams/addexam', {
                        title: 'Add Exam',
                        exam_id:exm.exam_id,
                        exam_name:exm.exam_name,
                        field:exm.field,
                        stream:exm.stream,
                        })
                } else {                
                    req.flash('success', 'Data added successfully!')
                    
                    // render to views/user/add.ejs
                    res.render('exams/addexam', {
                        title: 'Add Exam',
                        exam_id:'',
                        exam_name: '',
                        field:'',
                        stream:'',

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
        res.render('exams/addexam', { 
            title: 'Add Exam',
            exam_id:req.body.exam_id,
            exam_name: req.body.exam_name,
            field:req.body.field,
            stream:req.body.stream,
            })
    }
})
 
// SHOW EDIT USER FORM
app.get('/editexam/(:id)', function(req, res, next){
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM tests WHERE id = ' + req.params.id, function(err, rows, fields) {
            if(err) throw err
            
            // if class not found
            if (rows.length <= 0) {
                req.flash('error', 'Exam not found with id = ' + req.params.id)
                res.redirect('/exam')
            }
            else { // if class found
                // render to views/classes/editclass.ejs template file
                res.render('exams/editexam', {
                    title: 'Edit Exam', 
                    //data: rows[0],
                    id: rows[0].id,
                    exam_id: rows[0].exam_id,
                    exam_name: rows[0].exam_name,
                    field:rows[0].field,
                    stream: rows[0].stream,
                    })
            }            
        })
    })
})
 
// EDIT classes POST ACTION
app.put('/editexam/:id', function(req, res, next) {
    req.assert('exam_id', 'Exam Id is required').notEmpty()           //Validate name
    req.assert('exam_name', 'Exam Name is required').notEmpty()
    req.assert('field', 'Field is required').notEmpty()
    req.assert('stream','Stream is required').notEmpty()
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var exm = {
            exam_id: req.sanitize('exam_id').escape().trim(),
            exam_name: req.sanitize('exam_name').escape().trim(),
            field: req.sanitize('field').escape().trim(),
            stream: req.sanitize('stream').escape().trim(),
            
                     
        }
        
        req.getConnection(function(error, conn) {
            console.log(req.params);

            conn.query('UPDATE tests SET ? WHERE id = ' + req.params.id, exm, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('exams/editexam', {
                        title: 'Edit Exam',
                        exam_id: req.body.exam_id,
                        exam_name: req.body.exam_name,
                        field:req.body.field,
                        stream: req.body.stream,
                        })
                } else {
                    req.flash('success', 'Data updated successfully!')
                    
                    conn.query('SELECT * FROM tests ORDER BY id DESC',function(err, rows, fields) {
                        //if(err) throw err
                        if (err) {
                            req.flash('error', err)
                            res.render('exams/examlist', {
                                title: 'Exam List', 
                                data: ''
                            })
                        } else {
                            // render to views/user/list.ejs template file
                            res.render('exams/examlist', {
                                title: 'Exam List', 
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
        res.render('exams/editexam', { 
            title: 'Edit Exam',            
            
            exam_id: req.body.exam_id,
            exam_name: req.body.exam_name,
            field:req.body.field,
            stream: req.body.stream,
            })
    }
})
 
// DELETE Class
app.delete('/delete/(:id)', function(req, res, next) {
    var exm = { id: req.params.id }
    
    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM tests WHERE id = ' + req.params.id, exm, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/exam')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/exam')
            }
        })
    })
})
 
module.exports = app