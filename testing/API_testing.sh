#primero,correr los comandos de abajo
# chmod +x test_script.sh
# ./test_script.sh

#!/bin/bash
#!/bin/bash

YOUR_SERVER_ADDRESS="localhost:3001"

# Test GET /
echo -e "Testing GET /\n"
curl "http://${YOUR_SERVER_ADDRESS}/"

# Test POST /signup
echo -e "\nTesting POST /signup\n"
curl -X POST -H "Content-Type: application/json" -d '{"username": "your_username", "password": "your_password"}' "http://${YOUR_SERVER_ADDRESS}/signup"

# Test POST /login
echo -e "\nTesting POST /login\n"
curl -X POST -H "Content-Type: application/json" -d '{"username": "your_username", "password": "your_password"}' "http://${YOUR_SERVER_ADDRESS}/login"

# Continue testing other endpoints...

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


