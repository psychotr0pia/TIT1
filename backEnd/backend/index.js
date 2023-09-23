require('dotenv').config()
const express = require('express');
const cors = require('cors')
const bodyParser = require('body-parser');
const { config } = require('./services/config');
const app = express();

app.use(cors())
app.use(bodyParser.json());

//RUTAS
require('./routes/main_route')(app, config());
require('./routes/usuario_route')(app, config());
require('./routes/reserva_route')(app, config());
require('./routes/seguro_route')(app, config());
require('./routes/cobertura_route')(app, config());
require('./routes/admin_route')(app, config());
require('./routes/propiedad_route')(app, config());

//Inicio de servidor
app.listen(3000, function () {
    console.log('Server on port 3000');
});