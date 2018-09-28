var express = require('express')
var app = express()

 
// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM fields ORDER BY id DESC',function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.render('field/fieldlist', {
                    title: 'Field List', 
                    data: ''
                })
            } else {
                // render to views/user/list.ejs template file
                res.render('field/fieldlist', {
                    title: 'Field List', 
                    data: rows
                })
            }
        })
    })
})
 
// SHOW ADD Class FORM
app.get('/addfield', function(req, res, next){    
    // render to views/user/add.ejs
    res.render('field/addfield', {
        title: 'Add Field',
        field_name: '',
    })
})
 
// ADD NEW Content POST ACTION
app.post('/addfield', function(req, res, next){    
    req.assert('field_name', 'Field Name is required').notEmpty()           
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var fld = {
            field_name: req.sanitize('field_name').escape().trim(),
            
        }
        
        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO fields SET ?', fld, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('field/addfield', {
                        title: 'Add Field',
                        field_name:fld.field_name,
                        })
                } else {                
                    req.flash('success', 'Data added successfully!')
                    
                    // render to views/user/add.ejs
                    res.render('field/addfield', {
                        title: 'Add Field',
                        field_name: '',
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
        res.render('field/addfield', { 
            title: 'Add Field',
            field_name: req.body.field_name,
            })
    }
})
 
// SHOW EDIT USER FORM
app.get('/editfield/(:id)', function(req, res, next){
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM fields WHERE id = ' + req.params.id, function(err, rows, fields) {
            if(err) throw err
            
            // if class not found
            if (rows.length <= 0) {
                req.flash('error', 'Field not found with id = ' + req.params.id)
                res.redirect('/fields')
            }
            else { // if class found
                // render to views/classes/editclass.ejs template file
                res.render('field/editfield', {
                    title: 'Edit Field', 
                    //data: rows[0],
                    id: rows[0].id,
                    field_name: rows[0].field_name,
                    })
            }            
        })
    })
})
 
// EDIT classes POST ACTION
app.put('/editfield/:id', function(req, res, next) {
    req.assert('field_name', 'Field Name is required').notEmpty()           //Validate name
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var fld = {
            field_name: req.sanitize('field_name').escape().trim(),
            }
        
        req.getConnection(function(error, conn) {
            console.log(req.params);

            conn.query('UPDATE fields SET ? WHERE id = ' + req.params.id, fld, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('field/editfield', {
                        title: 'Edit Field',
                        field_name: req.body.field_name,
                        })
                } else {
                    req.flash('success', 'Data updated successfully!')
                    
                    conn.query('SELECT * FROM fields ORDER BY id DESC',function(err, rows, fields) {
                        //if(err) throw err
                        if (err) {
                            req.flash('error', err)
                            res.render('field/fieldlist', {
                                title: 'Field List', 
                                data: ''
                            })
                        } else {
                            // render to views/user/list.ejs template file
                            res.render('field/fieldlist', {
                                title: 'Field List', 
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
        res.render('field/editfield', { 
            title: 'Edit Field',            
            
            field_name: req.body.field_name,
            })
    }
})
 
// DELETE Class
app.delete('/delete/(:id)', function(req, res, next) {
    var fld = { id: req.params.id }
    
    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM fields WHERE id = ' + req.params.id, fld, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/fields')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/fields')
            }
        })
    })
})
 
module.exports = app