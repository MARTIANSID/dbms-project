const express = require('express');
const authController=require('../controllers/customerShop')
const router = express.Router();


router.get(
    '/shops/all',
    authController.getAll
)



router.post(
    '/shop/id',
    authController.getShopById
)

router.post(
    '/product',
    authController.getProducts
)

router.post(
    '/shopOwner',
    authController.getShopOwner

)





module.exports=router