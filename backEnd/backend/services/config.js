//Knex sirve para poder realizar instancias de mysql con lenguaje Js
const config = () => {
    const knex = require('knex')({
        client: 'mysql',
        connection:{
            host : 'localhost',
            port : 3306,
            user : 'root',
            password : '231465978',
            database : 'venta_propiedades',
        }
    })
    //Crear y Leer usuarios
    const table1 = 'usuario'
    const nuevoUsuario = () =>{
        return knex.schema.createTable(table1, (table) => {
            table.varchar('nombre_usuario')
            table.varchar('contrasena')
            table.date('fecha_nacimiento')
            table.varchar('correo')
            table.integer('telefono_usuario')
            table.primary('nombre_usuario')
        })
    }

    const crearUsuario = ({ nombre_usuario, contrasena, fecha_nacimiento, correo, telefono_usuario }) => {
        return knex(table1).insert({
            nombre_usuario: nombre_usuario,
            contrasena: contrasena,
            fecha_nacimiento: fecha_nacimiento,
            correo: correo,
            telefono_usuario: telefono_usuario
        });
    };
    const leerUser_res = () =>{
        return knex(table1).select('usuario.nombre_usuario','usuario.correo','propiedad.region', 'propiedad.comuna', 'propiedad.calle', 'propiedad.numero', 'propiedad.cant_habitaciones', 'propiedad.comuna', 'reserva.fecha_inicio', 'reserva.fecha_final').join('reserva', {'usuario.nombre_usuario':'reserva.nombre_usuario'}).join('propiedad', {'reserva.id_propiedad': 'propiedad.id_propiedad'});
    }
    const leerUsuario = () =>{
        return knex(table1).select()
    }
    const cambiarUsuario = (nombre, { nombre_usuario, fecha_nacimiento, correo, telefono_usuario }) => {
        return knex(table1).where({'nombre_usuario': nombre}).update({'nombre_usuario': nombre_usuario, 'fecha_nacimiento': fecha_nacimiento, 'correo': correo, 'telefono_usuario': telefono_usuario});
    }
    // Quitar borrar todos (?)
    const borrarTodosUsuarios = () => {
        return knex(table1).delete()
    }
    const borrarUsuario = (usuarioEliminar) => {
        return knex(table1).delete().where('nombre_usuario', [usuarioEliminar])
    }
    
    //Crear y leer ventas
    const table2 = 'reserva'
    const nuevaReserva = () =>{
        return knex.schema.createTable(table2, (table) => {
            table.increments('id_reserva')
            table.date('fecha_inicio')
            table.date('fecha_final')
            table.varchar('metodo_pago')
            table.varchar('nombre_usuario')
            table.integer('id_propiedad').unsigned()
            table.primary('id_reserva')
            table.foreign('nombre_usuario').references('usuario.nombre_usuario').onUpdate('CASCADE').onDelete('CASCADE')
            table.foreign('id_propiedad').references('propiedad.id_propiedad').onUpdate('CASCADE').onDelete('CASCADE')
        })
    }

    const crearReserva = ({ fecha_inicio, fecha_final, metodo_pago, nombre_usuario, id_propiedad }) => {
        return knex(table2).insert({
            fecha_inicio: fecha_inicio,
            fecha_final: fecha_final,
            metodo_pago: metodo_pago,
            nombre_usuario: nombre_usuario,
            id_propiedad: id_propiedad
        });
    };

    const leerReserva = () =>{
        return knex(table2).select();
    }
    const borrarReserva = () => {
        return knex(table2).delete().whereBetween('monto_venta', [1,200000])
    }
    const cambiarReserva = () => {
        return knex(table2).where({'id_reserva': 1}).update({'monto_venta': 450000})
    }

    //Crear y leer seguros
    const table3 = 'seguro'
    const nuevoSeguro = () =>{
        return knex.schema.createTable(table3, (table) => {
            table.increments('id_seguro')
            table.varchar('aseguradora')
            table.integer('id_propiedad').unsigned()
            table.primary('id_seguro')
            table.foreign('id_propiedad').references('propiedad.id_propiedad').onUpdate('CASCADE').onDelete('CASCADE')
        })
    }

    const crearSeguro = ({ aseguradora }) => {
        return knex(table3).insert({
            aseguradora: aseguradora
        });
    };

    const leerSeguro = () =>{
        return knex(table3).select();
    }
    //Crear y leer coberturas
    const table4 = 'cobertura'
    const nuevaCobertura = () =>{
        return knex.schema.createTable(table4, (table) => {
            table.varchar('tipo_cobertura')
            table.integer('id_seguro').unsigned()
            table.primary(['tipo_cobertura','id_seguro'])
            table.foreign('id_seguro').references('seguro.id_seguro').onUpdate('CASCADE').onDelete('CASCADE')
        })
    }
    const crearCobertura = ({ tipo_cobertura, id_seguro }) => {
        return knex(table4).insert({
            tipo_cobertura: tipo_cobertura,
            id_seguro: id_seguro
        });
    };

    const leerCobertura = () =>{
        return knex(table4).select();
    }

    const dropCobertura = () => {
        return knex.schema.dropTable('cobertura')
    }

    //Crear y leer Administradores
    const table5 = 'administrador'
    const nuevoAdmin = () =>{
        return knex.schema.createTable(table5, (table) => {
            table.varchar('nombre_admin')
            table.varchar('correo_admin')
            table.integer('telefono_admin')
            table.primary('nombre_admin')
        })
    }

    const crearAdmin = ({nombre_admin, correo_admin, telefono_admin }) => {
        return knex(table5).insert({
            nombre_admin: nombre_admin,
            correo_admin: correo_admin,
            telefono_admin: telefono_admin
        });
    };

    const leerAdmin = () =>{
        return knex(table5).select();
    }
    const leerAdmin_prop = () =>{
        return knex(table5).select('administrador.nombre_admin', 'administrador.correo_admin','propiedad.id_propiedad').join('propiedad',{'administrador.nombre_admin':'propiedad.nombre_admin'})
    }
    //Crear y leer propiedades
    const table6 = 'propiedad'
    const nuevaPropiedad = () =>{
        return knex.schema.createTable(table6, (table) => {
            table.increments('id_propiedad');
            table.varchar('region');
            table.varchar('comuna');
            table.varchar('calle');
            table.integer('numero');
            table.integer('cant_habitaciones');
            table.integer('cant_baños');
            table.integer('precio');
            table.varchar('imagen')
            table.varchar('nombre_admin');
            table.primary('id_propiedad');
            table.foreign('nombre_admin').references('administrador.nombre_admin').onUpdate('CASCADE').onDelete('CASCADE')
        })
    }

    const crearPropiedad = ({ region, comuna, calle, numero, cant_habitaciones, cant_baños, precio, imagen, nombre_admin }) => {
        return knex(table6).insert({
            region: region,
            comuna: comuna,
            calle: calle,
            numero: numero,
            cant_habitaciones: cant_habitaciones,
            cant_baños: cant_baños,
            precio: precio,
            imagen: imagen,
            nombre_admin: nombre_admin
        });
    };

    const leerPropiedad = () =>{
        return knex(table6).select();
    }
    const borrarPropiedad = () => {
        return knex(table6).delete().where('region', ["una region"])
    }

    return{
        nuevoUsuario, crearUsuario,leerUsuario,leerUser_res, cambiarUsuario,
        nuevaReserva, crearReserva, leerReserva, borrarReserva, cambiarReserva,
        nuevoSeguro, crearSeguro, leerSeguro,
        nuevaCobertura, crearCobertura, leerCobertura, dropCobertura,
        nuevoAdmin, crearAdmin, leerAdmin, leerAdmin_prop,
        nuevaPropiedad, crearPropiedad, leerPropiedad, borrarPropiedad, borrarTodosUsuarios,
        borrarUsuario
    };
};

module.exports = {
    config
};