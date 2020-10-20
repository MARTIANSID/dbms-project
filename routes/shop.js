const express = require('express');
const { body } = require('express-validator');

// const User = require('../model/user');
const authController = require('../controllers/shop');
const isAuth=require('../middlewares/isAuth')

const router = express.Router();


router.post(
    '/shop/make',
    isAuth,
    authController.makeShop
)


router.post(
    '/shop/add/products',
    isAuth,
    authController.addProduct
)

router.get(
    '/shop/details',
    isAuth,
    authController.getShopInfo
)

router.get(
    '/shop/getProducts',
    isAuth,
    authController.getProducts
)

module.exports=router