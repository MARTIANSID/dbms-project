const mysql=require('mysql2');

const db =mysql.createConnection({
    host :'localhost',
    user:'root',
    password:'manGla1232', //Abbey dc loool dekh maine thode edits kiye lol
    database:'delivery'
})

db.connect((err=>{
    if(err){
        throw err;
    }
    console.log('mysql');
}))
module.exports=db;