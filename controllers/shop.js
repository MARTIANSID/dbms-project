
const uniqId = require("uniqid");
const db = require("../database/database");
const { propfind } = require("../routes/shop");


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


exports.getShopInfo=async(req,res,next)=>{
    const shopId=req.shopId;

    let sql=`SELECT * FROM shop where shopId='${shopId}'`
    db.query(sql, (err, result) => {
        if (err) {
         
          console.log(err);
        }
     else{
         res.status(200).json({
             message:"DATA ADDED!!",
             data:result,

         })
     }
      });

}








exports.addProduct=async(req,res,next)=>{
    const shopId=req.shopId;
    const pno=uniqId();
    const quantity=req.body.quantity;
    const price=req.body.price;
    const name=req.body.name;
    const company=req.body.company;
    let prodId;
    let sql=`SELECT prodId FROM shop WHERE shopId=${shopId}`;
    db.query(sql, (err, result) => {
        if (err) {
         
          console.log(err);
        }
     else{
        prodId=result[0].prodId;

        let sqll=`INSERT INTO shop (shopId,pno,quantity,price,name,prodId,company) VALUES ('${shopId}','${pno}','${quantity}','${price}','${name}','${prodId}','${company}')`;

        db.query(sqll, (err, result) => {
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
})
}
