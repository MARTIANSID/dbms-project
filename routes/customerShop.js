const express = require('express');
const authController=require('../controllers/customerShop')
const router = express.Router();


router.get(
    '/shops/all',
    authController.getAll
)









module.exports=router