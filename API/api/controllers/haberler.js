const mongoose= require('mongoose');

const Haber=require('../models/haberler');

exports.haberler_get_all=(req,res,next) => {

    Haber.find().select('haberTitle haberDescription haberImage').exec().then(docs =>{
        const response ={
            count:docs.length,
            haberler:docs.map(doc => {
                return {
                    haberTitle:doc.haberTitle,
                    haberDescription:doc.haberDescription,
                    haberImage:doc.haberImage,
                    request: {
                        type:'GET',
                        url:'http//localhost:3000/haberler/'+doc._id
                    }
                }
            })
        }
            res.status(200).json(response);
        

    }).catch(err => {
        console.log(err);
        res.status(500).json({
            error:err
        });
    });
}

exports.haberler_create_haber=(req,res,next) => {

    console.log(req.file);


    const haber = new Haber({

            _id:new mongoose.Types.ObjectId(),
            haberTitle:req.body.haberTitle,
            haberDescription:req.body.haberDescription,
            haberImage:req.file.path
    });

    haber.save().then(result => {
         console.log(result);
         res.status(201).json({
            message:'kayit basariyla olusturuldu',
            createdHaber:{
                haberTitle:result.haberTitle,
                haberDescription:result.haberDescription,
                _id:result._id,
                request:{
                    type:'GET',
                    url:'http//localhost:3000/haberler/'+result._id
                }
            }
        });
    })

    .catch(err=>{
        console.log(err);
        res.status(500).json({
            error:err
        });
    
    });


   
}

