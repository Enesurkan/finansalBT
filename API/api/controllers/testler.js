const mongoose=require('mongoose');
const Test=require('../models/testler');

exports.testSonuc=(req,res,next)=>{

    
    
    
    const test =new Test({
        _id:new mongoose.Types.ObjectId(),
        NE:req.body.NE,
        WBC:req.body.WBC,
        RBC:req.body.RBC,
        HGB:req.body.HGB,
        HCT:req.body.HCT,
        MCHC:req.body.MCHC,
        MCV:req.body.MCV,
        LYM:req.body.LYM,
        RDW:req.body.RDW,
        PLT:req.body.PLT,
        MPV:req.body.MPV
    });
    
    var sayac=0;

    test.save()
    .then(test =>{

        


        if(test.WBC >= 12.0 | test.WBC <= 3.0)
        {
        sayac++;

        }
    if(test.NE >= 80 | test.NE <= 35)
        {
        sayac++;

        }
    if(test.RBC >= 6 | test.RBC <= 3.2)
        {
        sayac++;

        }
    if(test.HGB >= 18 | test.HGB <= 10)
        {
        sayac++;

        }
    if(test.HCT >= 55 | test.HCT <= 33.6)
        {
        sayac++;

        }
    if(test.MCHC >= 36 | test.MCHC <= 30)
        {
        sayac++;

        }
    if(test.MCH >= 33 | test.MCH <= 25)
        {
        sayac++;

        }
    if(test.MCV >= 105 | test.MCV <= 78)
        {
        sayac++;

        }

    if(test.LYM >= 50 | test.LYM <= 15)
        {
        sayac++;

        }
    if(test.RDW >= 18 | test.RDW <= 9)
        {
        sayac++;

        }
    if(test.PLT >= 500 | test.PLT <= 150)
        {
        sayac++;

        }
    if(test.MPV >= 15 | test.MPV <= 0)
        {
        sayac++;

        }

        sayac=sayac/12;
        sayac=sayac*100;

        test.save()
       .then(result=>{



            res.status(200).json({
            hastalikYuzdesi:sayac,
            isSuccess:true,
            responseMessage:"Sonucunuz yukarıda yazmaktadır",
            
        })



       })
            


        

        
    })
       
       
    .catch(err=>{
        console.log(err);
        res.status(500).json({
            error:err
        });
    
    });

        
   





    
}