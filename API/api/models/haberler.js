const mongoose=require('mongoose');

const haberSchema= mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    haberImage:{type:String ,required:true},
    haberDescription:{type:String,required:true},
    haberTitle:{type:String,required:true}
});

module.exports=mongoose.model('Haber',haberSchema);