var express = require('express')
var app = express()

 
// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM subjects ORDER BY id DESC',function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.render('subjects/subjectlist', {
                    title: 'Subject List', 
                    data: ''
                })
            } else {
                // render to views/user/list.ejs template file
                res.render('subjects/subjectlist', {
                    title: 'Subject List', 
                    data: rows
                })
            }
        })
    })
})
 
// SHOW ADD Class FORM
app.get('/addsubject', function(req, res, next){    
    // render to views/user/add.ejs
    res.render('subjects/addsubject', {
        title: 'Add Subject',
        subject_id:'',
        subject_name: '',
    })
})
 
// ADD NEW Content POST ACTION
app.post('/addsubject', function(req, res, next){    
    req.assert('subject_id', 'Subject ID is required').notEmpty()           
    req.assert('subject_name', 'Subject Name is required').notEmpty()           
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var sbj = {
            subject_id: req.sanitize('subject_id').escape().trim(),         
            subject_name: req.sanitize('subject_name').escape().trim(),
            
        }
        
        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO subjects SET ?', sbj, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('subjects/addsubject', {
                        title: 'Add Subject',
                        subject_id:sbj.subject_id,
                        subject_name:sbj.subject_name,
                        })
                } else {                
                    req.flash('success', 'Data added successfully!')
                    
                    // render to views/user/add.ejs
                    res.render('subjects/addsubject', {
                        title: 'Add Subject',
                        subject_id:'',
                        subject_name: '',
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
        res.render('subjects/addsubject', { 
            title: 'Add Subject',
            subject_id:req.body.subject_id,
            subject_name: req.body.subject_name,
            })
    }
})
 
// SHOW EDIT USER FORM
app.get('/editsubject/(:id)', function(req, res, next){
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM subjects WHERE id = ' + req.params.id, function(err, rows, fields) {
            if(err) throw err
            
            // if class not found
            if (rows.length <= 0) {
                req.flash('error', 'Subject not found with id = ' + req.params.id)
                res.redirect('/subject')
            }
            else { // if class found
                // render to views/classes/editclass.ejs template file
                res.render('subjects/editsubject', {
                    title: 'Edit Subject', 
                    //data: rows[0],
                    id: rows[0].id,
                    subject_id:rows[0].subject_id,
                    subject_name: rows[0].subject_name,
                    })
            }            
        })
    })
})
 
// EDIT classes POST ACTION
app.put('/editsubject/:id', function(req, res, next) {
    req.assert('subject_id','Subject Id is required').notEmpty()
    req.assert('subject_name','Subject Name is required').notEmpty()           //Validate name
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var sbj = {
            subject_id:req.sanitize('subject_id').escape().trim(),
            subject_name: req.sanitize('subject_name').escape().trim(),
            }
        
        req.getConnection(function(error, conn) {
            console.log(req.params);

            conn.query('UPDATE subjects SET ? WHERE id = ' + req.params.id, sbj, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('subject/editsubject', {
                        title: 'Edit Subject',
                        subject_id:req.body.subject_id,
                        subject_name: req.body.subject_name,
                        })
                } else {
                    req.flash('success', 'Data updated successfully!')
                    
                    conn.query('SELECT * FROM subjects ORDER BY id DESC',function(err, rows, fields) {
                        //if(err) throw err
                        if (err) {
                            req.flash('error', err)
                            res.render('subjects/subjectlist', {
                                title: 'Subject List', 
                                data: ''
                            })
                        } else {
                            // render to views/user/list.ejs template file
                            res.render('subjects/subjectlist', {
                                title: 'Subject List', 
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
        res.render('subjects/editsubject', { 
            title: 'Edit Subject',            
            
            subject_id:req.body.subject_id,
            subject_name: req.body.subject_name,
            })
    }
})
 
// DELETE Class
app.delete('/delete/(:id)', function(req, res, next) {
    var sbj = { id: req.params.id }
    
    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM subjects WHERE id = ' + req.params.id, sbj, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/subject')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/subject')
            }
        })
    })
})
 
module.exports = app