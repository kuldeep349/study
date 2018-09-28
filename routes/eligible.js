var express = require('express')
var app = express()

 
// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM eligibilities ORDER BY id DESC',function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.render('eligibility/eligibilitylist', {
                    title: 'Eligibility List', 
                    data: ''
                })
            } else {
                // render to views/user/list.ejs template file
                res.render('eligibility/eligibilitylist', {
                    title: 'Eligibility List', 
                    data: rows
                })
            }
        })
    })
})
 
// SHOW ADD Class FORM
app.get('/addeligibility', function(req, res, next){    
    // render to views/user/add.ejs
    res.render('eligibility/addeligibility', {
        title: 'Add Eligibility',
        requirement: '',
        eligibility_type:'',        
        value:'',  
        unit:'',
        pursuing:'',
        category:'',
        gender:'',
    })
})
 
// ADD NEW Content POST ACTION
app.post('/addeligibility', function(req, res, next){    
    req.assert('requirement', 'Requirement is required').notEmpty()           
    req.assert('eligibility_type', 'Eligibility Type is required').notEmpty()         
    req.assert('value', 'Value is required').notEmpty()
    req.assert('unit', 'Unit is required').notEmpty()
    req.assert('pursuing', ' Pursuing Details are required').notEmpty()
    req.assert('category', 'Category Type is required').notEmpty()
    req.assert('gender', 'Gender is required').notEmpty() 
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var elg = {
            requirement: req.sanitize('requirement').escape().trim(),
            eligibility_type: req.sanitize('eligibility_type').escape().trim(),
            value:req.sanitize('value').escape().trim(),
            unit:req.sanitize('unit').escape().trim(),
            pursuing:req.sanitize('pursuing').escape().trim(),
            category:req.sanitize('category').escape().trim(),
            gender:req.sanitize('gender').escape().trim(),
            
        }
        
        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO eligibilities SET ?', elg, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('eligibility/addeligibility', {
                        title: 'Add Eligibility',
                        requirement:elg.requirement,
                        eligibility_type: elg.eligibility_type,
                        value:elg.value,
                        unit:elg.unit, 
                        pursuing:elg.pursuing,
                        category:elg.category,
                        gender:elg.gender,                   
                    })
                } else {                
                    req.flash('success', 'Data added successfully!')
                    
                    // render to views/user/add.ejs
                    res.render('eligibility/addeligibility', {
                        title: 'Add Eligibility',
                        requirement: '',
                        eligibility_type:'',
                        value:'',
                        unit:'',
                        pursuing:'',
                        category:'',
                        gender:'',


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
        res.render('eligibility/addeligibility', { 
            title: 'Add Eligibility',
            requirement: req.body.requirement,
            eligibility_type: req.body.eligibility_type,
            value:req.body.value,
            unit:req.body.unit,
            pursuing:req.body.pursuing,
            category:req.body.category,
            gender:req.body.gender,
        })
    }
})
 
// SHOW EDIT USER FORM
app.get('/editeligibility/(:id)', function(req, res, next){
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM eligibilities WHERE id = ' + req.params.id, function(err, rows, fields) {
            if(err) throw err
            
            // if class not found
            if (rows.length <= 0) {
                req.flash('error', 'Eligibility not found with id = ' + req.params.id)
                res.redirect('/eligible')
            }
            else { // if class found
                // render to views/classes/editclass.ejs template file
                res.render('eligibility/editeligibility', {
                    title: 'Edit Eligibilty', 
                    //data: rows[0],
                    id: rows[0].id,
                    requirement: rows[0].requirement,
                    eligibility_type: rows[0].eligibility_type,
                    unit: rows[0].unit,
                    value: rows[0].value,
                    pursuing: rows[0].pursuing,
                    category: rows[0].category,
                    gender:rows[0].gender                    
                })
            }            
        })
    })
})
 
// EDIT classes POST ACTION
app.put('/editeligibility/:id', function(req, res, next) {
    req.assert('requirement', 'Requirement is required').notEmpty()           //Validate name
    req.assert('eligibility_type', 'Eligibility Type  is required').notEmpty()
    req.assert('unit','Unit is required').notEmpty()
    req.assert('value','Value is required').notEmpty()
    req.assert('pursuing', 'Pursuing Details are required').notEmpty()
    req.assert('category', 'Category is required').notEmpty()
    req.assert('gender', 'Gender is required').notEmpty()
    
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var elg = {
            requirement: req.sanitize('requirement').escape().trim(),
            eligibility_type: req.sanitize('eligibility_type').escape().trim(),
            unit: req.sanitize('unit').escape().trim(),
            value: req.sanitize('value').escape().trim(),
            pursuing: req.sanitize('pursuing').escape().trim(),
            category: req.sanitize('category').escape().trim(),
            gender: req.sanitize('gender').escape().trim(),
                       
                     
        }
        
        req.getConnection(function(error, conn) {
            console.log(req.params);

            conn.query('UPDATE eligibilities SET ? WHERE id = ' + req.params.id, elg, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('eligibility/editeligibility', {
                        title: 'Edit Eligibilities',
                        requirement: req.body.requirement,
                        eligibility_type: req.body.eligibility_type,
                        unit: req.body.unit,
                        value: req.body.value,
                        pursuing: req.body.pursuing,
                        category: req.body.category,
                        gender:req.body.gender
                    })
                } else {
                    req.flash('success', 'Data updated successfully!')
                    
                    conn.query('SELECT * FROM eligibilities ORDER BY id DESC',function(err, rows, fields) {
                        //if(err) throw err
                        if (err) {
                            req.flash('error', err)
                            res.render('eligibility/eligibilitylist', {
                                title: 'Eligibility List', 
                                data: ''
                            })
                        } else {
                            // render to views/user/list.ejs template file
                            res.render('eligibility/eligibilitylist', {
                                title: 'Eligibility List', 
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
        res.render('eligibility/editeligibility', { 
            title: 'Edit Eligibility',            
            
            requirement: req.body.requirement,
            eligibility_type: req.body.eligibility_type,
            unit: req.body.unit,
            value: req.body.value,
            pursuing:req.body.pursuing,
            category: req.body.category,
            gender: req.body.gender,
        })
    }
})
 
// DELETE Class
app.delete('/delete/(:id)', function(req, res, next) {
    var elg = { id: req.params.id }
    
    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM eligibilities WHERE id = ' + req.params.id, elg, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/eligible')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/eligible')
            }
        })
    })
})
 
module.exports = app