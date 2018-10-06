var express = require('express')
var app = express()


// SHOW ADMIN LOGIN FORM
app.get('/usie', function(req, res, next){
	console.log('you are here');
	req.assert('email','email is required').notEmpty()           //Validate id
    req.assert('password','password is required').notEmpty()         //Validate class name

    var errors = req.validationErrors()
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM tbl_users', function(err, rows) {
           
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