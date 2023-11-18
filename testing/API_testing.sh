#primero,correr los comandos de abajo
# chmod +x API_testing.sh
# ./API_testing.sh

#!/bin/bash
#!/bin/bash

YOUR_SERVER_ADDRESS="localhost:3001"

# Test POST /signup
echo  "\nTesting POST /signup\n"
curl -X POST -H "Content-Type: application/json" -d '
    {"username": "userTEST", 
    "password": "password_test",
    "rol": "rol_test"}' "http://${YOUR_SERVER_ADDRESS}/signup"

# Test POST /login
echo "\nTesting POST /login\n"
curl -X POST -H "Content-Type: application/json" -d '
    {"username": "userTEST", 
    "password": "password_test"}' "http://${YOUR_SERVER_ADDRESS}/login"

# Register an event by sending a POST request to the server
echo "\nTesting POST /registrarEvento\n"
curl -X POST -H "Content-Type: application/json" -d '{
    "responsable": "John Doe",
    "fecha_creacion": "2023-11-13 12:30:00",
    "fecha": "2023-11-13 13:45:00",
    "tipo": "SomeType",
    "descripcion": "Some Description",
    "id_camara": 1
}' http://localhost:3001/registrarEvento


# Test GET /camaras
echo -e "\nTesting GET /camaras\n"
curl "http://${YOUR_SERVER_ADDRESS}/camaras"

# Test GET /tiposEventos
echo -e "\nTesting GET /tiposEventos\n"
curl "http://${YOUR_SERVER_ADDRESS}/tiposEventos"

# Test GET /historialEstadoCamara/:idCamara
echo -e "\nTesting GET /historialEstadoCamara/:1\n"
curl "http://${YOUR_SERVER_ADDRESS}/historialEstadoCamara/1"

# Test POST /actualizarEstadoCamara
echo -e "\nTesting POST /actualizarEstadoCamara\n"
curl -X POST -H "Content-Type: application/json" -d '{"idCamara": "your_idCamara", "nuevoEstadoId": "your_nuevoEstadoId"}' "http://${YOUR_SERVER_ADDRESS}/actualizarEstadoCamara"

# Continue testing other endpoints...

# Test GET /estadoActualCamara/:id
echo -e "\nTesting GET /estadoActualCamara/:id\n"
curl "http://${YOUR_SERVER_ADDRESS}/estadoActualCamara/your_id"


