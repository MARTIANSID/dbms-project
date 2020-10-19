const express = require('express');
const { body } = require('express-validator');

// const User = require('../model/user');
const authController = require('../controllers/customer_login');
const isAuth=require('../middlewares/isAuthCustomer')
const router = express.Router();

router.post(
  '/customer/phone',
  authController.customerNumberCheck
);

router.post(
  '/customer/signUp',
  authController.signUp
)

router.post(
  '/customer/login',
  authController.login
)

module.exports=router