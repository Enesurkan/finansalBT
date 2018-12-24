const express=require('express');
const router =express.Router();
const TestController= require('../controllers/testler');


router.post('/',TestController.testSonuc);

module.exports=router;