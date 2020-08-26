const express = require('express');
const { body } = require('express-validator');

// const User = require('../model/user');
const authController = require('../controllers/customer_login');
// const isAuth=require('../middleware/isAuth')
const router = express.Router();

router.post(
  '/signup',
  authController.signup
);

module.exports=router