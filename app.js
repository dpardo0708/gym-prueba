const express = require('express');
const bodyParser = require('body-parser');

const pool = require('./models/conection')

const app = express();

const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


app.get('/login/:userlogin/:password', (request, response) => {
  const userlogin = request.params.userlogin;
  const password = request.params.password;

 
  pool.query('SELECT * FROM login WHERE login_name = ? AND  login_password = ?',[userlogin,password] ,(error, result) => { 
       console.log(result[0])
       if(result[0] === undefined){
        response.send({
          success: 200,
          message: "Usuario o contraseña incorrecta",
        }); 

       }else{
        response.send({
          success: 200,
          message: "Sesión iniciada",
        }); 
       }
     
  });
});

app.post('/city', (request, response) => {

 const query = 'INSERT INTO city (city_name) VALUES (?)';
 const city = request.body.city_name
 pool.query(query,city, (error, result) => { 
     if (error) throw error;
     console.log(result.insertId);

      response.status(201).send(`Se ha ingresado una nueva ciudad`);
  });
});

app.post('/sedes', (request, response) => {

 const query = 'INSERT INTO venues SET ?';
 const venue = request.body
 pool.query(query,venue, (error, result) => { 
     if (error) throw error;

      response.status(201).send(`Sede agregada`);
  });
});


app.post('/users', (request, response) => {

 let select = 'SELECT COUNT(user_document_number) document FROM users WHERE user_document_number = ? '
 let query = 'INSERT INTO users SET ?';
 let venue = request.body
 let document = request.body.user_document_number

 pool.query(select,document, (error, result) => { 
   const documentCount = result[0].document
   if(documentCount === 0){
    pool.query(query,venue, (error, result) => { 
         if (error) throw error;
    
          response.status(201).send(`user added`);
      });
    }else{
      response.send({
        message: "El usuario ya se encuentra creado",
      });

    }
});
});

app.get('/users/:cityCode/:venueCode', (request, response) => {
  const cityCode = request.params.cityCode;
  const venueCode = request.params.venueCode;
 
  pool.query('SELECT u.user_name, u.user_document_number, v.venue_name, c.city_name  FROM users u, venues v, city c WHERE u.venue_cod = v.venue_cod AND v.city_cod = c.city_cod AND c.city_cod = ? AND u.venue_cod = ?',[cityCode,venueCode] ,(error, result) => { 
    response.send(result);   
  });
});

app.listen(port)