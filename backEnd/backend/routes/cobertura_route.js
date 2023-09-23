const { response } = require("express");

module.exports = function(app, config){

    //Crear COBERTURA
    app.get('/crear_cobertura', (request,response) => {
        config.nuevaCobertura()
        .then(() => {
            response.json({"mensaje": "tabla de cobertura creada"});
        }).catch(e => response.status(500).json(e));
    });
    
    //GET COBERTURA
    app.get('/cobertura', (request,response) => {
        config.leerCobertura()
        .then(cobertura => {
            response.json(cobertura);
        }).catch(e => response.status(500).json(e));
    });

    //POST COBERTURA
    app.post('/cobertura', (request,response) => {
        const newCobertura = request.body;
        console.log(newCobertura);

        config.crearCobertura(newCobertura)
        .then(() => {
            response.json({"mensaje": "coberturas almacenadas"});
         }).catch(e => {
            response.status(500).json(e);
         });
    });

    //DELETE VENTA
    app.delete('/cobertura', (request,response) =>{
        config.dropCobertura()
        .then( () => {
            response.json({"mensaje:": "tabla cobertura eliminada"});
        }).catch(e => response.status(500).json(e))
    });

}