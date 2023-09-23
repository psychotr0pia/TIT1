const { response } = require("express");

module.exports = function(app, config){

    //CREAR TABLA ADMINISTRADOR
    app.get('/crear_administrador', (request,response) => {
        config.nuevoAdmin()
        .then(() => {
            response.json({"mensaje": "tabla de administrador creada"});
        }).catch(e => response.status(500).json(e));
    });

    //GET ADMIN
    app.get('/administrador', (request,response) => {
        config.leerAdmin()
        .then(administrador => {
            response.json(administrador);
        }).catch(e => res.status(500).json(e))
    });

    app.get('/administrador_propiedad', (request,response) => {
        config.leerAdmin_prop()
        .then(administrador => {
            response.json(administrador);
        })
    });

    //POST ADMIN
    app.post('/administrador', (request,response) => {
        const newAdmin = request.body;
        console.log(newAdmin);

        config.crearAdmin(newAdmin)
        .then(() => {
            response.json({"mensaje": "Administrador registrado"});
         }).catch(e => {
            response.status(500).json(e);
         });
    });
}