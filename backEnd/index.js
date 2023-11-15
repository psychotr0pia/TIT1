const express = require('express');
const server = express();
const mysql = require('mysql2');
const cors = require('cors');
const session = require('express-session');
const jwt = require('jsonwebtoken');
const moment = require('moment-timezone');

moment.tz.setDefault('America/Santiago');
server.use(session({
    secret: 'secret',
    resave: false,
    saveUninitialized: false,
    cookie: {
        secure: false,
        maxAge: 1000 * 60 * 60 * 24
    }
}))
const dbConfig = {
    host: "regcam_mysql",
    user: "admin",
    password: "password",
    database: "regcam",
    charset: "utf8mb4",
    port: 3306,
};

const db = mysql.createPool(dbConfig);

server.use(express.json());
server.use(cors());

//login

server.get('/', (req, res) => {
    if (req.session.username) {
        return res.json({ valid: true, role: req.session.role });
    } else {
        return res.json({ valid: false });
    }
})
server.post('/sigup', (req, res) => {
    const sql = "insert into users (username, password) values (?)";
    const values = [
        req.body.username,
        req.body.password
    ]

    db.query(sql, [values], (err, result) => {
        if (err) return res.json({ Message: "Error en el servidor" });
        return res.json(result);
    })
})

server.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Realizar una consulta a la base de datos para verificar las credenciales del usuario
    const sql = 'SELECT * FROM users WHERE username = ? AND password = ?';

    db.query(sql, [username, password], (err, results) => {
        if (err) {
            console.error('Error al consultar la base de datos:', err);
            res.status(500).json({ error: 'Error en el servidor' });
        } else if (results.length > 0) {
            const user = results[0];

            // Generar un token JWT con el rol del usuario
            const token = jwt.sign({ username: user.username, role: user.role }, 'tu_secreto_secreto', {
                expiresIn: '1h', // Tiempo de expiración del token
            });

            res.json({ token, user });
        } else {
            // Credenciales incorrectas
            res.status(401).json({ error: 'Credenciales incorrectas' });
        }
    });
});

server.post("/registrarEvento", (req, res) => {
    const { fecha } = req.body;
    const { tipo } = req.body;
    const { descripcion } = req.body;
    const { id_camara } = req.body;

    let sql = "INSERT INTO registros (fecha, tipo, descripcion, id_camara) VALUES (?,?,?,?)"
    db.query(sql, [fecha, tipo, descripcion, id_camara], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }
    })
});

server.get("/registrosCamara/:id", (req, res) => {
    const { id } = req.params;
    let sql = "select registros.id, registros.id_camara, registros.tipo, registros.fecha, eventos.color, registros.descripcion from registros join camara on registros.id_camara = camara.id join eventos on eventos.tipo = registros.tipo where registros.id_camara = ?";
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }

    })
});


server.delete("/eliminarRegistro/:id", (req, res) => {
    const { id } = req.params;
    let sql = "delete from registros where id = ?"
    db.query(sql, [id], (err, result) => { err ? console.log(err) : res.send(result) })
})


server.get("/locacionCamara/:id", (req, res) => {
    const { id } = req.params;
    let sql = "SELECT locacion from camara where id = ?";
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }
    })
});

server.get("/registros", (req, res) => {
    let sql = "SELECT registros.id, registros.responsable, registros.fecha_creacion, registros.fecha, registros.tipo, registros.descripcion, registros.id_camara, eventos.color from registros join eventos on registros.tipo = eventos.tipo order by fecha_creacion desc";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }

    })
});

server.get("/locaciones", (req, res) => {
    let sql = "SELECT locacion from camara group by locacion";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }

    })
});

server.post("/registrarEstados", (req, res) => {
    const datos = req.body;
    const insertPromises = datos.map((item) => {
        const { id, evento, fecha } = item;
        const sql = "INSERT INTO Estados (id_camara, evento, fecha) VALUES (?,?,?)";
        const values = [id, evento, fecha];
        return new Promise((resolve, reject) => {
            db.query(sql, values, (err, result) => {
                if (err) {
                    console.error(err);
                    reject(err);
                } else {
                    resolve(result);
                }
            });
        });
    });

    Promise.all(insertPromises)
        .then((results) => {
            res.json(results);
        })
        .catch((error) => {
            res.status(500).json({ error: 'Error interno del servidor' });
        });
});


server.get("/camaras", (req, res) => {
    let sql = `
    SELECT 
    C.id,
    C.locacion,
    E.nombre AS EstadoActual,
    E.color,
    H.fechaInicio AS FechaUltimoCambio
FROM 
    camara C
    JOIN historialestado H ON C.id = H.idCamara
    JOIN estadocamara E ON H.idEstadoCamara = E.id
WHERE 
    H.fechaInicio = (
        SELECT MAX(H2.fechaInicio)
        FROM historialestado H2
        WHERE H2.idCamara = C.id
    )
ORDER BY 
    C.id;
    `;
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
        } else {
            res.send(result);
        }
    });
});


server.get("/tiposEventos", (req, res) => {
    let sql = "SELECT * from eventos";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }

    })
});


server.get("/historialEstadoCamara/:idCamara", (req, res) => {
    const { idCamara } = req.params;

    let sql = `
    SELECT
    HE1.idCamara,
    EC1.nombre AS EstadoAnterior,
    EC2.nombre AS EstadoActual,
    HE1.fechaInicio AS FechaCambio
FROM 
    (SELECT 
        H.idCamara,
        H.idEstadoCamara,
        H.fechaInicio,
        LAG(H.idEstadoCamara) OVER (PARTITION BY H.idCamara ORDER BY H.fechaInicio) AS EstadoAnteriorId
    FROM 
        HistorialEstado H
    WHERE 
        H.idCamara = ?) AS HE1  -- Ajusta este número al ID de la cámara que desees consultar
JOIN EstadoCamara EC1 ON HE1.EstadoAnteriorId = EC1.id
JOIN EstadoCamara EC2 ON HE1.idEstadoCamara = EC2.id
WHERE 
    HE1.EstadoAnteriorId IS NOT NULL
ORDER BY 
    HE1.fechaInicio;
    `;
    
    db.query(sql, [idCamara], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: "Error al obtener el historial de la cámara" });
        } else {
            res.json(result);
        }
    });
});


server.post("/actualizarEstadoCamara", (req, res) => {
    const { idCamara, nuevoEstadoId } = req.body;
    
    let sql = "INSERT INTO HistorialEstado (idCamara, idEstadoCamara, fechaInicio) VALUES (?, ?, NOW())";
    db.query(sql, [idCamara, nuevoEstadoId], (err, result) => {
        if (err) {
            res.status(500).json({ error: "Error al actualizar el estado de la cámara" });
        } else {
            res.status(200).json({ message: "Estado de la cámara actualizado correctamente" });
        }
    });
});



server.post("/registrarEstado", (req, res) => {
    const { nombre } = req.body;
    const { superfamilia } = req.body;
    let sql = "insert into Estados (nombre, superfamilia) values (?,?)";
    db.query(sql, [nombre, superfamilia], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }
    })
});



server.get("/actualizarRegistro/:id", (req, res) => {
    const { id } = req.params;
    let sql = "select * from registros where id = ?";
    db.query(sql, [id], (err, result) => {
        if (err) {
            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
        } else {
            console.log(result[0].tipo, result[0].fecha, result[0].descripcion)
            res.send(result);
        }

    })
})

server.get("/estados", (req, res) => {
    let sql = "select * from estadocamara";
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }
    })
});

server.post("/crearCamara", (req, res) => {
    // Aquí se espera que 'camaras' sea un array de objetos con la locación de cada cámara
    const { camaras } = req.body;

    // Preparar las consultas de inserción para las cámaras
    let sqlCamara = "INSERT INTO Camara (locacion) VALUES ?";
    let valoresCamaras = camaras.map(camara => [camara.locacion]);

    // Ejecutar la inserción de las cámaras
    db.query(sqlCamara, [valoresCamaras], (err, resultCamara) => {
        if (err) {
            res.status(500).json({ error: "Error al crear las cámaras" });
        } else {
            // Para cada cámara creada, establecer el estado inicial 'Apagada'
            let idsCamaras = [];
            for (let i = resultCamara.insertId; i < resultCamara.insertId + camaras.length; i++) {
                idsCamaras.push([i, 2, new Date()]); // Suponiendo que el ID para 'Apagada' en EstadoCamara es 2
            }

            let sqlEstado = "INSERT INTO HistorialEstado (idCamara, idEstadoCamara, fechaInicio) VALUES ?";
            db.query(sqlEstado, [idsCamaras], (err, resultEstado) => {
                if (err) {
                    res.status(500).json({ error: "Error al establecer el estado inicial de las cámaras" });
                } else {
                    res.status(200).json({ message: "Cámaras creadas y estado inicial establecido a 'Apagada'" });
                }
            });
        }
    });
});



server.get("/estadoActualCamara/:id", (req, res) => {
    const { id } = req.params;

    let sql = `
        SELECT 
            C.id AS CamaraID,
            C.locacion,
            E.nombreEstado AS EstadoActual,
            MAX(H.fechaInicio) AS FechaUltimoCambio
        FROM 
            HistorialEstado H
            JOIN Camara C ON H.idCamara = C.id
            JOIN EstadoCamara E ON H.idEstadoCamara = E.id
        WHERE 
            C.id = ?
        GROUP BY 
            C.id, C.locacion, E.nombreEstado
        ORDER BY 
            FechaUltimoCambio DESC
        LIMIT 1;
    `;


    console.log(id)

    db.query(sql, [id], (err, result) => {
        if (err) {
            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
        } else {
            if (result.length > 0) {
                console.log(result[0].EstadoActual, result[0].FechaUltimoCambio);
                res.send(result[0]);
            } else {
                res.status(404).json({ error: "No se encontró la cámara con el ID proporcionado" });
            }
        }
    });
});

server.post("/actualizarRegistro", (req, res) => {
    const { id } = req.body;
    const { tipo } = req.body;
    const { descripcion } = req.body;
    const { fecha } = req.body;
    const { id_camara } = req.body;
    const fecha_actual = moment().format('YYYY-MM-DD HH:mm:ss');

    //obtener el estado actual del registro y mandarlo al historial
    let estado_actual = "select * from registros where id = ?";
    db.query(estado_actual, [id], (err, result) => {
        if (err) {
            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
        } else {
            let actualizar_historial = "insert into historial (id_registro, tipo, fecha, fecha_modificacion, descripcion, id_camara) values (?,?,?,?,?,?)";
            db.query(actualizar_historial, [id, result[0].tipo, result[0].fecha, fecha_actual, result[0].descripcion, result[0].id_camara], (err, result) => {
                if (err) {
                    res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
                } else {
                    let actualizar_estado_registro = "UPDATE registros SET fecha = ?, fecha_creacion = ?, tipo = ?, descripcion = ?, id_camara = ? WHERE id = ?";
                    db.query(actualizar_estado_registro, [fecha, fecha_actual, tipo, descripcion, id_camara, id], (err, result) => {
                        if (err) {
                            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
                        } else {
                            res.send(result);
                        }
                    })
                }
            })
        }
    })
})

server.get("/historial/:id", (req, res) => {
    const id = req.params.id;

    let sql = "SELECT * from historial where id_registro = ? order by fecha_modificacion desc";
    db.query(sql, [id], (err, result) => {
        if (err) {
            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
        } else {
            res.send(result);
        }
    })
})
server.post("/guardarRegistro", (req, res) => {
    const { id_camara } = req.body;
    const { tipo } = req.body;
    const { fecha } = req.body;
    const { descripcion } = req.body
    const { responsable } = req.body;
    const fecha_actual = moment().format('YYYY-MM-DD HH:mm:ss');
    let sql = "insert into registros (responsable, fecha_creacion, tipo, fecha, descripcion, id_camara) values (?,?,?,?,?,?)";
    db.query(sql, [responsable, fecha_actual, tipo, fecha, descripcion, id_camara], (err, result) => {
        if (err) {
            res.status(500).json({ error: "Hubo un error en la consulta a la base de datos" });
        } else {
            res.send(result);
        }
    })
});


server.put("/actualizarRegistro/:id", (req, res) => {
    const registroId = req.params.id;
    const { tipo, fecha, descripcion } = req.body;

    let sql = "UPDATE registros SET tipo = ?, fecha = ?, descripcion = ? WHERE id = ?";

    db.query(sql, [tipo, fecha, descripcion, registroId], (err, result) => {
        if (err) {
            console.log(err);
            res.status(500).json({ error: 'Error al actualizar el registro' });
        } else {
            res.json({ message: 'Registro actualizado con éxito' });
        }
    });
});



server.listen(3001, () =>
    console.log("Corriendo en 3001")
);

