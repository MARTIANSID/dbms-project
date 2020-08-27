const db=require('../database/database');
const uniqId=require('uniqid');
const bycrypt=require('bcryptjs')

exports.signup= async (req,res,next)=>{
const phoneNumber=req.body.phoneNumber;
const password=req.body.password;
const userName=req.body.userName;
const uniqueId=uniqId()



const hashedPw = await bcrypt.hash(password, 12);
let sql=""  //insert into table
db.query(sql,(err,result)=>{
    if(err){
        const err=new Error("failed to add in database");

    }
    console.log("added");

})
}
exports.checkNumber=async(req,res,next)=>{

}
exports.login=async(req,res,next)=>{
    const phoneNumber=req.body.phoneNumber;
    const password=req.body.password;
let sql =""
db.query(sql,(err,result)=>{
    if(err){
        const err=new Error("failed to add in database");

    }
    console.log("added");

}) //check in database for password;


}