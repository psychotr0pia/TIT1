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

    const table1 = 'camara'
    const nuevoCamara = () =>{
        return knex.schema.createTable(table1, (table) => {
            table.integer('id')
            table.varchar('locacion')
            table.varchar('estado')
            table.primary('id')
        })
    }

    const crearCamara = ({ id, locacion, estado }) => {
        return knex(table1).insert({
            id: id,
            locacion: locacion,
            estado: estado,
        });
    };

    const leerCamaras = () =>{
        return knex(table1).select()
    }
    const locacionCamara = (id_camara) => {
        return knex(table1).where({'id_camara': id_camara}).select('locacion')
    }
    const leerLocaciones = () =>{
        return knex(table1).select('locacion').groupBy('locacion')
    }
    const cambiarEstado = (id_camara, estado) =>{
        return knex(table1).where({'id_camara': id_camara}).update({'tipo_estado': estado})
    }

    // Consultas USUARIOS

    const table2 = 'usuario'
    const nuevoUsuario = () =>{
        return knex.schema.createTable(table2, (table) => {
            table.integer('id_usuario')
            table.varchar('nombre')
            table.varchar('apellido1')
            table.varchar('apellido2')
            table.varchar('clave')
            table.varchar('rol')
            table.primary('id_usario')
        })
    }

    const crearUsuario = ({ id_usuario, nombre, apellido1, apellido2, clave, rol }) => {
        return knex(table2).insert({
            id_usuario: id_usuario,
            nombre: nombre,
            apellido1: apellido1,
            apellido2: apellido2,
            clave: clave,
            rol: rol
        });
    };

    const leerUsuario = () =>{
        return knex(table2).select()
    }

    // Consultas EVENTOS

    const table3 = 'evento'
    const nuevoEvento = () =>{
        return knex.schema.createTable(table3, (table) => {
            table.integer('id_evento')
            table.varchar('tipo_evento')
            table.varchar('descripcion')
            table.date('fecha')
            table.primary('id_evento')
            table.varchar('descripcion')
            table.foreign('id').references('camara.id').onUpdate('CASCADE').onDelete('CASCADE')
            table.foreign('id_usario').references('usuario.id_usuario').onUpdate('CASCADE').onDelete('CASCADE')
        })
    }

    const leerEventos = () =>{
        return knex(table3).select()
    }
    const leerRegistroCam = (id_camara) => {
        return knex(table3).select('eventos.id_evento', 'eventos.tipo_evento', 'eventos.descripcion', 'eventos.fecha').join('camaras', 'eventos.id_camara', 'camaras.id_camara').where({'camaras.id_camara': id_camara})
    }
    const registrarEvento = (id_camara, tipo_evento, descripcion, fecha) => {
        return knex(table3).insert({'tipo_evento': tipo_evento, 'descripcion': descripcion, 'fecha': fecha, 'id_camara': id_camara})
    }
    // *** REVISAR Y CAMBIAR MAS TARDE *** //
    const eliminarRegistro = (id_evento) => {
        return knex(table3).where({'id_evento': id_evento}).delete()
    }

    return{
        nuevoCamara, crearCamara, nuevoUsuario, crearUsuario, leerUsuario, locacionCamara,leerCamaras, leerLocaciones, leerRegistroCam,
        leerEventos, registrarEvento, eliminarRegistro, cambiarEstado
    };
};

module.exports = {
    config
};