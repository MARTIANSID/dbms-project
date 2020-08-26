const express=require('express');
const bodyParser=require('body-parser');
const path=require('path');
const db=require('./database/database');
const app=express();




// routes
const customer_login=require('./routes/customer_login');



app.use(bodyParser.json());
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader(
      'Access-Control-Allow-Methods',
      'OPTIONS, GET, POST, PUT, PATCH, DELETE'
    );
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
  });

app.get('/',(req,res,next)=>{
  let sql="INSERT INTO noob values(4,'omkar')";
 db.query(sql,(err,result)=>{
if(err){
  throw err;
}
 })
})
app.get('/getData',(req,res,next)=>{
  let sql="SELECT * FROM noob";
  db.query(sql,(err,result)=>{
    if(err){
      throw err;
    }
    res.send(result);
  })
})

//  app.post('/',(req,res,next)=>{
// const name= req.body.name;
// res.send(name);
// })


app.use((err,req,res,next)=>{
   res.status(400).json({

    message:err.message,
    err:'Failed',
   }) 

})

app.use(customer_login);
app.listen(3000);





