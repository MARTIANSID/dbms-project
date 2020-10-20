exports.getAll =async(req,res,next)=>{
    let sql='SELECT * FROM shop';

    db.query(sql,(err,result)=>{
        if(err){
            const err=new Error("failed to add in database");
            throw err
    
        }
   res.status(200).json({
       data:result,
       message:'Got Data!!!'
   })
       
    
    })



}