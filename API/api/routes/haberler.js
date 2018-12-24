const express=require('express');
const router =express.Router();
const multer= require('multer');
const HaberController= require('../controllers/haberler');

const storage= multer.diskStorage({
    destination: function(req,file,cb){  //resim ayarlari
        cb(null,'./uploads/');
    },
    filename: function(req,file,cb){
        cb(null, Date.now() + file.originalname);
    }

});

const fileFilter=(req,file,cb)=>{
    
    if(file.mimetype==='image/jpeg' ||  file.mimetype === 'image/png'){  //resim kontroloru
        cb(null,true);
    }
    else{
        cb(null,false);
    }
    
    
}

const upload = multer({storage:storage, limits:{
    fileSize: 300*150*5                           //resimin limitini belirler ve yukler
},

fileFilter:fileFilter

});


router.get('/',HaberController.haberler_get_all);

router.post('/',upload.single('haberImage'),HaberController.haberler_create_haber);


module.exports = router;