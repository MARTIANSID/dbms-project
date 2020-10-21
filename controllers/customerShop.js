const db=require('../database/database');

exports.getAll =async(req,res,next)=>{
    let sql='SELECT * FROM shop';

    db.query(sql,(err,result)=>{
        if(err){
           console.log(err);
        }
   res.status(200).json({
       data:result,
       message:'Got Data!!!'
   })
       
    
    })



}