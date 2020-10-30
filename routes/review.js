const express = require('express');
const authController=require('../controllers/review')
const router = express.Router();


router.post(
    '/comments',
    authController.getComments
)



router.post(
    '/add/customer',
    authController.addCustomer
)

router.post(
    '/add/comment',
    authController.addComment
)






module.exports=router