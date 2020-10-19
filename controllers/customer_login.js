const db=require('../database/database');
const uniqId=require('uniqid');
const bycrypt=require('bcryptjs')
const jwt=require('jsonwebtoken');


exports.customerNumberCheck=async(req,res,next)=>{
    const phoneNumber=req.body.phoneNumber;
    try{
    let sql=`SELECT cid FROM customer WHERE phone=${phoneNumber}`;
    db.query(sql,(err,result)=>{
        if(err){
            const err=new Error("failed to add in database");
            throw err
    
        }
    if(result.length!=0){
        res.status(200).json({isRegistered:true})
    }else{
        res.status(200).json({isRegistered:false})
    }
       
    
    })
    }catch(err){

    }

}



exports.signUp = async (req, res, next) => {
    const phoneNumber = req.body.phoneNumber;
    const name = req.body.name;
    const address=req.body.address;
    const password = req.body.password;
    const  cid=uniqId();
    console.log(password);
    console.log("hjell");
  
    let sql = `INSERT INTO customer (name,password,phone,cid,address) VALUES ('${name}',${password},${phoneNumber},'${cid}','${address}')`;
    let token = jwt.sign(
      { username: name, password: password, cid:cid },
      "somesupersecretsecret",
      { expiresIn: "100h" }
    );
  
    db.query(sql, (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res
          .status(200)
          .json({ message: "Data Added!!!!", token: token, user: result });
      }
    });
  };
  


// 
  exports.login = async (req, res, next) => {
    const phoneNumber = req.body.phoneNumber;
    const password = req.body.password;
    let sql = `SELECT cid FROM customer where password=${password} AND phone=${phoneNumber} `;
  
    db.query(sql, (err, result) => {
      if (err) {
        console.log(err);
      } else {
        if (result.length != 0) {
            console.log(result)
          let token = jwt.sign(
            { cid: result[0], password: password, phoneNumber: phoneNumber },
            "somesupersecretsecret",
            { expiresIn: "100h" }
          );
          res.status(200).json({
            user: result[0],
            message: "Authenticated",
            token: token,
          });
        } else {
          res.json({
            message: "Not Autherised",
          });
        }
      }
    });
  };
  

