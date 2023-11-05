const config = () => {
    const knex = require('knex')({
        client: 'mysql',
        connection:{
            host : 'localhost',
            port : 3306,
            user : 'root',
            password : '', // *** PONER LA CONTRASEÑA DE SU BD ***
            database : 'regcam',
        }
    })

    // Consultas CAMARAS
    const leerCamaras = () =>{
        return knex('camaras').select()
    }
    const locacionCamara = (id_camara) => {
        return knex('camaras').where({'id_camara': id_camara}).select('locacion')
    }
    const leerLocaciones = () =>{
        return knex('camaras').select('locacion').groupBy('locacion')
    }

    // Consultas EVENTOS
    const leerEventos = () =>{
        return knex('eventos').select()
    }
    const leerRegistroCam = (id_camara) => {
        return knex('eventos').select('eventos.id_evento', 'eventos.tipo_evento', 'eventos.descripcion', 'eventos.fecha').join('camaras', 'eventos.id_camara', 'camaras.id_camara').where({'camaras.id_camara': id_camara})
    }
    const registrarEvento = (id_camara, tipo_evento, descripcion, fecha) => {
        return knex('eventos').insert({'tipo_evento': tipo_evento, 'descripcion': descripcion, 'fecha': fecha, 'id_camara': id_camara})
    }
    // *** REVISAR Y CAMBIAR MAS TARDE *** //
    const eliminarRegistro = (id_evento) => {
        return knex('eventos').where({'id_evento': id_evento}).delete()
    }

    return{
        locacionCamara,leerCamaras, leerLocaciones, leerRegistroCam,
        leerEventos, registrarEvento, eliminarRegistro
    };
};

module.exports = {
    config
};