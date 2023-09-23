const { response } = require("express");

module.exports = function(app, config){

    //CRAR TABLA USUARIO
    app.get('/crear_usuario', (request,response) => {
        config.nuevoUsuario()
        .then(() => {
            response.json({"mensaje": "tabla de usuario creada"});
        }).catch(e => response.status(500).json(e));
    });

    //GETS USUARIO
    app.get('/usuario', (request,response) => {
        config.leerUsuario()
        .then(usuario => {
            response.json(usuario);
        }).catch(e => response.status(500).json(e))
    });

    app.get('/usuario_reserva', (request,response) => {
        config.leerUser_res()
        .then(usuario => {
            response.json(usuario);
        }).catch(e => response.status(500).json(e))
    });

    //POST USUARIO
    app.post('/usuario', (request,response) => {
        const newUsuario = request.body;
        console.log(newUsuario);

        config.crearUsuario(newUsuario)
        .then(() => {
            response.json({"mensaje": "usuario creado"});
         }).catch(e => {
            response.status(500).json(e);
         });
    });

    app.put('/usuario/:nombre_usuario', (request,response) => {
        const cambiar = request.params.nombre_usuario;
        const modUsuario = request.body;
        console.log(modUsuario);

        config.cambiarUsuario(cambiar, modUsuario)
        .then(() => {
            response.json({"mensaje": "usuario cambiado"});
         }).catch(e => {
            response.status(500).json(e);
         });
    });

    app.delete('/usuario', (request,response) =>{
        config.borrarTodosUsuarios()
        .then(() => {
            response.json({"mensaje": "Todos los usuarios eliminados"});
        }).catch(e => response.status(500).json(e))
    });

    app.delete('/usuario/:nombre_usuario', (request,response) =>{
        const usuarioEliminar = request.params.nombre_usuario
        config.borrarUsuario(usuarioEliminar)
        .then(() => {
            response.json({"mensaje": "usuario eliminado"});
        }).catch(e => response.status(500).json(e))
    });
}