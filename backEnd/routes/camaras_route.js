module.exports = function(app, config){

    app.get("/camaras", (req, res) => {
        config.leerCamaras()
        .then(camaras => {
            res.json(camaras);
        }).catch(e => res.status(500).json(e))
    });
    
    app.get("/locacionCamara/:id_camara", (req, res) => {
        const id = req.params.id_camara;
        config.locacionCamara(id)
        .then(camara => {
            res.json(camara);
        }).catch(e => res.status(500).json(e))
    });

    app.get("/locaciones", (req, res) => {
        config.leerLocaciones()
        .then(camaras => {
            res.json(camaras);
        }).catch(e => res.status(500).json(e))
    });

    app.put("/actualizarEstado/:id_camara", (req, res) => {
        const id = req.params.id_camara;
        const { tipo_estado } = req.body;
        config.cambiarEstado(id, tipo_estado)
        .then(() => {
            res.json({"mensaje": "estado cambiado"});
        }).catch(e => res.status(500).json(e))
    });
}