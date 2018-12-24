const express=require('express');
const app=express();
const morgan=require('morgan');
const bodyParser =require('body-parser');
const mongoose = require('mongoose');


const haberRoutes=require('./api/routes/haberler');
const testRoutes=require('./api/routes/testler');


mongoose.connect('mongodb://berkan:'+
process.env.MONGO_ATLAS_PW+
'@cluster0-shard-00-00-gbmnd.mongodb.net:27017,cluster0-shard-00-01-gbmnd.mongodb.net:27017,cluster0-shard-00-02-gbmnd.mongodb.net:27017/test?ssl=true&replicaSet=Cluster0-shard-0&authSource=admin&retryWrites=true',
{ useNewUrlParser: true }

);

mongoose.Promise=global.Promise;

app.use (morgan('dev'));
app.use('/uploads',express.static('uploads'));
app.use (bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use((req,res,next) =>{
    res.header("Access-Control-Allow-Origin","*");
    res.header(
        "Acess-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type,Accept, Authorization"
    );

    if(req.method === 'OPTIONS'){
        res.header('Access-Conrol-Allow-Methods','PUT, POST, PATCH , DELETE, GET');
        return res.status(200).json({});
    }   
    next();
});
app.use('/haberler',haberRoutes ); 
app.use('/testler',testRoutes);


app.use((req,res,next)  => {

    const error = new Error('bulunamadi');
    error.status=404;                              //404 hatasi
    next(error);

});

app.use((error,req,res,next) => {
    res.status(error.status || 500);
    res.json({
        error:{
                message:error.message          //diger hatalar
        }
    });
});


module.exports = app;