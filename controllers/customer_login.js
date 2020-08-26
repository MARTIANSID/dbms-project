const db=require('../database/database');
const uniqId=require('uniqid');

exports.signup=(req,res,next)=>{
const phoneNumber=req.body.phoneNumber;
const password=req.body.password;
const userName=req.body.userName;
const uniqueId=uniqId();


// let sql="CREATE TABLE CUSTOMER(C_ID int(20) PRIMARY KEY,ADDRESS VARCHAR(40),NAME VARCHAR(30) NOT NULL,CONTACT_NO int NOT NULL)";
// db.query(sql,(err,result)=>{
//     if(err){
//         throw err;
//     }
//     console.log('added user');
// let sql=    `INSERT INTO CUSTOMER VALUES(123,'vellore','${userName}',${phoneNumber})`;
db.query(sql,(err,result)=>{
    if(err){
        throw err;
    }
    console.log("added")
    console.log(result)
})

}