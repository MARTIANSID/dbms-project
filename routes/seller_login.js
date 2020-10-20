const express = require('express');
const { body } = require('express-validator');

// const User = require('../model/user');
const authController = require('../controllers/seller_login');
// const isAuth=require('../middleware/isAuth')
const router = express.Router();

router.post(
  '/seller/phone',
  authController.sellerNumberCheck
);

router.post(
    '/seller/signUp',
    authController.signUp
)
router.post(
    '/seller/login',
    authController.login
)

module.exports=router