require('dotenv').config()
const express = require('express');
const cors = require('cors')
const bodyParser = require('body-parser');
const { config } = require('./services/config');
const app = express();

app.use(cors())
app.use(bodyParser.json());

//RUTAS
require('./routes/camaras_route')(app, config());
require('./routes/eventos_route')(app, config());

//Inicio de servidor
app.listen(3000, function () {
    console.log('Server on port 3000');
});