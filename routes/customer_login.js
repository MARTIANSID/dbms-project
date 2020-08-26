const express = require('express');
const { body } = require('express-validator');

const User = require('../model/user');
const authController = require('../controllers/auth');
const isAuth=require('../middleware/isAuth')
const router = express.Router();

router.put(
  '/signup',
  [
    body('email')
      .isEmail()
      .withMessage('Please enter a valid email.')
      .custom((value, { req }) => {
        return User.findOne({ email: value }).then(userDoc => {
          if (userDoc) {
            return Promise.reject('E-Mail address already exists!');
          }
        });
      })
      .normalizeEmail(),
    body('password')
      .trim()
      .isLength({ min: 5 }),
    body('username')
      .trim()
      .not()
      .isEmpty()
  ],
  authController.signup
);

module.exports=router