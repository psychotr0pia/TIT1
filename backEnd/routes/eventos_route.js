module.exports = function(app, config){
    
    app.get("/eventos", (req, res) => {
        config.leerEventos()
        .then(eventos => {
            res.json(eventos);
        }).catch(e => res.status(500).json(e))
    });

    app.get("/registrosCamara/:id_camara", (req, res) => {
        const id_camara = req.params.id_camara;
        config.leerRegistroCam(id_camara)
        .then(eventos => {
            res.json(eventos);
        }).catch(e => res.status(500).json(e))
    });
    
    app.post("/registrarEvento/:id_camara", (req, res) => {
        const id_camara = req.params.id_camara;
        const { tipo_evento } = req.body;
        const { descripcion } = req.body;
        const { fecha } = req.body;

        config.registrarEvento(id_camara, tipo_evento, descripcion, fecha)
        .then(() => {
            res.json({"mensaje": "evento registrado"});
         }).catch(e => {
            res.status(500).json(e);
         });
    });

    app.delete("/eliminarEvento/:id", (req, res) => {
        const id_evento = req.params.id;
        config.eliminarRegistro(id_evento)
        .then(() => {
            res.json({"mensaje": "registro eliminado"});
        }).catch(e => res.status(500).json(e))
    })
}