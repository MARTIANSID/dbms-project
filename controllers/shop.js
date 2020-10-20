
const uniqId = require("uniqid");
const db = require("../database/database");


exports.makeShop=async(req,res,next)=>{
    const address=req.body.address;
    const shopId=req.shopId;
    const category=req.body.category
    const prodId=uniqId();
    const noOfProducts=req.body.noOfProducts==null?0:req.body.noOfProducts;
    const shopName=req.body.shopName;
    console.log(category);

    let sql=`INSERT INTO shop (address,shopId,prodId,noOfProducts,shopName,category) VALUES ('${address}','${shopId}','${prodId}','${noOfProducts}','${shopName}','${category}')`;

    db.query(sql, (err, result) => {
        if (err) {
         
          console.log(err);
        }
     else{
         res.status(200).json({
             message:"DATA ADDED!!",

         })
     }
      });
}

