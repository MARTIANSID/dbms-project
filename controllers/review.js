const db=require('../database/database');
const uniqId=require('uniqid');

exports.addComment=async(req,res,next)=>{
    const comment=req.body.comment;
    const shopId=req.body.shopId;
    const cid=req.body.cid;

    const sql=`INSERT INTO review (cid,shopId,comment) VALUES ('${cid}','${shopId}','${comment}')`;
    db.query(sql,(err,result)=>{
        if(err){
           console.log(err);
        }
   res.status(200).json({
       message:'Added Comment'
   })
       
    
    })


}

exports.addCustomer=async(req,res,next)=>{
    const name=req.body.name;
    const cid=uniqId();
    const sql=`INSERT INTO customer (cid,name) VALUES ('${cid}','${name}')`;

 db.query(sql,(err,result)=>{
        if(err){
           console.log(err);
        }
   res.status(200).json({
       message:'Customer Added!',
       cid:cid,
   })
       
    
    })



}

exports.getComments=async(req,res,next)=>{
    const shopId=req.body.shopId;
    

    const sql=`SELECT * FROM review WHERE shopId ='${shopId}'`
    db.query(sql,(err,result)=>{
        if(err){
           console.log(err);
        }
   res.status(200).json({
       data:result,
       message:'Got Data'
   })
       
    
    })

}