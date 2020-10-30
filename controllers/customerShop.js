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

exports.getShopById=async(req,res,next)=>{
   
    const shopId=req.body.shopId
    console.log(shopId)
    let sql=`SELECT * FROM shop WHERE shopId ='${shopId}'` 

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

exports.getProducts=async(req,res,next)=>{
    const prodId=req.body.prodId;
    console.log(prodId);
    let sql=`SELECT * FROM product where prodId='${prodId}'`
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

exports.getShopOwner=async(req,res,next)=>{
    const shopId=req.body.shopId;

    let sql=`SELECT * FROM sellerlogin WHERE shopId='${shopId}'`
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