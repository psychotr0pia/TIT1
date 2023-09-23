const { response } = require("express");

module.exports = function(app, config){

    //CREAR TABLA VENTA
    app.get('/crear_reserva', (request,response) => {
        config.nuevaReserva()
        .then(() => {
            response.json({"mensaje": "tabla de reserva creada"});
        }).catch(e => response.status(500).json(e));
    });

    //GET VENTA
    app.get('/reserva', (request,response) => {
        config.leerReserva()
        .then(venta => {
            response.json(venta);
        }).catch(e => response.status(500).json(e))
    });

    //DELETE VENTA
    app.delete('/reserva', (request,response) =>{
        config.borrarReserva()
        .then(venta => {
            response.json(venta);
        }).catch(e => response.status(500).json(e))
    });

    //POST VENTA
    app.post('/reserva', (request,response) => {
        const newReserva = request.body;
        console.log(newReserva);

        config.crearReserva(newReserva)
        .then(() => {
            response.json({"mensaje": "Reserva almacenada"});
         }).catch(e => {
            response.status(500).json(e);
         });
    });

    //PUT VENTA
    app.put('/reserva', (request,response) => {
        config.cambiarReserva()
        .then(() => {
            response.json({"mensaje": "Reserva cambiada"});
         }).catch(e => {
            response.status(500).json(e);
         });
    });
}