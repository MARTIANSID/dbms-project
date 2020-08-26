const express=require('express');

const bodyParser=require('body-parser');
const path=require('path');
const app=express();



app.use(bodyParser.json());
app.use(
    multer({ storage: storage, fileFilter: fileFilter }).single('image')
  );
 app.use('/images', express.static(path.join(__dirname, 'images')));
  




app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader(
      'Access-Control-Allow-Methods',
      'OPTIONS, GET, POST, PUT, PATCH, DELETE'
    );
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
  });
  


  app.use(userRoutes);
  app.use(postRoutes);
  app.use(chatRoutes);
  app.use(generalRoutes);


app.use((err,req,res,next)=>{
   res.status(400).json({

    message:err.message,
    err:'Failed',
   })

    

})




