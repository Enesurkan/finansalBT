const mongoose=require('mongoose');

const testSchema={
    _id:mongoose.Schema.Types.ObjectId,
    WBC:{type:Number},
    NE:{type:Number},
    RBC:{type:Number},
    HGB:{type:Number},
    HCT:{type:Number},
    MCHC:{type:Number},
    MCH:{type:Number},
    MCV:{type:Number},
    LYM:{type:Number},
    RDW:{type:Number},
    PLT:{type:Number},
    MPV:{type:Number}
};

module.exports=mongoose.model('Test',testSchema);;