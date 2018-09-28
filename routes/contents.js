var express = require('express')
var app = express()

 
// SHOW LIST OF classes
app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM content ORDER BY id DESC',function(err, rows, fields) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                res.render('content/contentlist', {
                    title: 'Content List', 
                    data: ''
                })
            } else {
                // render to views/user/list.ejs template file
                res.render('content/contentlist', {
                    title: 'Content List', 
                    data: rows
                })
            }
        })
    })
})
 
app.get('/viewpage', function(req, res) {
    res.render('content/viewpage');
});



// SHOW ADD Class FORM
app.get('/addcontent', function(req, res, next){    
    // render to views/user/add.ejs
    res.render('content/addcontent', {
        title: 'Add New Content',
        pdf_link: '',
        heading:'',
        content:'',        
        flipbook:'',  
        keywords:'',
        tags:'',
        owner:'',
    })
})
 
// ADD NEW Content POST ACTION
app.post('/addcontent', function(req, res, next){  
    console.log(req.body);  
    req.assert('pdf_link', 'PDF_Link is required').notEmpty()           
    req.assert('heading', 'Heading is required').notEmpty()
    req.assert('content', 'Content is required').notEmpty()         
    req.assert('flipbook', 'FlipBook is required').notEmpty()
    req.assert('keywords', 'Keywords are required').notEmpty()
    req.assert('tags', ' Tags are required').notEmpty()
    req.assert('owner', 'Owner Name is required').notEmpty() 
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var cont = {
            pdf_link: req.sanitize('pdf_link').escape().trim(),
            heading: req.sanitize('heading').escape().trim(),
            content: req.sanitize('content').escape().trim(),
            flipbook:req.sanitize('flipbook').escape().trim(),
            keywords:req.sanitize('keywords').escape().trim(),
            tags:req.sanitize('tags').escape().trim(),
            owner:req.sanitize('owner').escape().trim(),
            
        }
        
        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO content SET ?', cont, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('content/addcontent', {
                        title: 'Add New Content',
                        pdf_link: cont.pdf_link,
                        heading: cont.heading,
                        content:cont.content,
                        flipbook:cont.flipbook,
                        keywords:cont.keywords, 
                        tags:cont.tags,
                        owner:cont.owner,                   
                    })
                } else {                
                    req.flash('success', 'Data added successfully!')
                    
                    // render to views/user/add.ejs
                    res.render('content/addcontent', {
                        title: 'Add New Content',
                        pdf_link: '',
                        heading:'',
                        content:'',
                        flipbook:'',
                        keywords:'',
                        tags:'',
                        owner:'',


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
        res.render('content/addcontent', { 
            title: 'Add New Content',
            pdf_link: req.body.pdf_link,
            heading: req.body.heading,
            content:req.body.content,
            flipbook:req.body.flipbook,
            keywords:req.body.keywords,
            tags:req.body.tags,
            owner:req.body.owner,
        })
    }
})
 
// SHOW EDIT USER FORM
app.get('/editcontent/(:id)', function(req, res, next){
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM content WHERE id = ' + req.params.id, function(err, rows, fields) {
            if(err) throw err
            
            // if class not found
            if (rows.length <= 0) {
                req.flash('error', 'Content not found with id = ' + req.params.id)
                res.redirect('/contents')
            }
            else { // if class found
                // render to views/classes/editclass.ejs template file
                res.render('content/editcontent', {
                    title: 'Edit Content', 
                    //data: rows[0],
                    id: rows[0].id,
                    pdf_link: rows[0].pdf_link,
                    heading: rows[0].heading,
                    content:rows[0].content,
                    flipbook: rows[0].flipbook,
                    keywords: rows[0].keywords,
                    tags: rows[0].tags,
                    owner: rows[0].owner,                    
                })
            }            
        })
    })
})
 
// EDIT classes POST ACTION
app.put('/editcontent/:id', function(req, res, next) {
    req.assert('pdf_link', 'PDF-Link is required').notEmpty()           //Validate name
    req.assert('heading', 'Heading is required').notEmpty()
    req.assert('content', 'Content is required').notEmpty()
    req.assert('flipbook','flipbook is required').notEmpty()
    req.assert('keywords','Keywords are required').notEmpty()
    req.assert('tags', 'Tags are required').notEmpty()
    req.assert('owner', 'Owner is required').notEmpty()
    
    var errors = req.validationErrors()
    
    if( !errors ) {   //No errors were found.  Passed Validation!
        
        /********************************************
         * Express-validator module
         
        req.body.comment = 'a <span>comment</span>';
        req.body.username = '   a user    ';
 
        req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
        req.sanitize('username').trim(); // returns 'a user'
        ********************************************/
        var cont = {
            pdf_link: req.sanitize('pdf_link').escape().trim(),
            heading: req.sanitize('heading').escape().trim(),
            content: req.sanitize('content').escape().trim(),
            flipbook: req.sanitize('flipbook').escape().trim(),
            keywords: req.sanitize('keywords').escape().trim(),
            tags: req.sanitize('tags').escape().trim(),
            owner: req.sanitize('owner').escape().trim(),
            
                     
        }
        
        req.getConnection(function(error, conn) {
            console.log(req.params);

            conn.query('UPDATE content SET ? WHERE id = ' + req.params.id, cont, function(err, result) {
                //if(err) throw err
                if (err) {
                    req.flash('error', err)
                    
                    // render to views/user/add.ejs
                    res.render('content/editcontent', {
                        title: 'Edit Content',
                        pdf_link: req.body.pdf_link,
                        heading: req.body.heading,
                        content:req.body.content,
                        flipbook: req.body.flipbook,
                        keywords: req.body.keywords,
                        tags: req.body.tags,
                        owner: req.body.owner,
                    })
                } else {
                    req.flash('success', 'Data updated successfully!')
                    
                    conn.query('SELECT * FROM content ORDER BY id DESC',function(err, rows, fields) {
                        //if(err) throw err
                        if (err) {
                            req.flash('error', err)
                            res.render('content/contentlist', {
                                title: 'Content List', 
                                data: ''
                            })
                        } else {
                            // render to views/user/list.ejs template file
                            res.render('content/contentlist', {
                                title: 'Content List', 
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
        res.render('content/editcontent', { 
            title: 'Edit Content',            
            
            pdf_link: req.body.pdf_link,
            heading: req.body.heading,
            content:req.body.content,
            flipbook: req.body.flipbook,
            keywords: req.body.keywords,
            tags: req.body.tags,
            owner: req.body.owner,
        })
           
    }
})



// DELETE Class
app.delete('/delete/(:id)', function(req, res, next) {
    var cont = { id: req.params.id }
    
    req.getConnection(function(error, conn) {
        conn.query('DELETE FROM content WHERE id = ' + req.params.id, cont, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                // redirect to users list page
                res.redirect('/contents')
            } else {
                req.flash('success', 'User deleted successfully! id = ' + req.params.id)
                // redirect to users list page
                res.redirect('/contents')
            }
        })
    })
})
 

module.exports = app