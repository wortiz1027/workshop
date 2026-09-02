import { check, sleep } from 'k6';
import { UsersClient } from '../users.client.js'; // Sube 1 nivel para el cliente
import { getSelectedEnv } from '../../../../config/environments.js'; // Sube 4 niveles para el entorno

// 1. ZONA DE CONFIGURACIÓN (Init Context)
// Definimos una curva de carga progresiva escalonada de hasta 30 usuarios virtuales (VUs)
export const options = {
    stages: [
        { duration: '20s', target: 10 },  // Rampa inicial suave (0 a 10 usuarios)
        { duration: '40s', target: 10 },  // Estabilidad baja (Mantener 10 usuarios)
        { duration: '20s', target: 30 },  // Segunda rampa (Subir a 30 usuarios)
        { duration: '40s', target: 30 },  // Estabilidad media (Mantener 30 usuarios)
        { duration: '10s', target: 0 },   // Descenso controlado
    ],
};

// Recuperamos la configuración del entorno activo (dev / prod)
const currentEnv = getSelectedEnv();

// 2. ZONA DE EJECUCIÓN (VU Logic - Bucle de Usuarios Virtuales)
export default function () {
    // Consultamos el reporte del usuario base 'usr-0001' registrado en tu script SQL
    const response = UsersClient.getReport(currentEnv.users_url, 'usr-0001');

    // Validamos la respuesta del reporte agregado
    check(response, {
        'Status es 200 OK': (r) => r.status === 200,
        'Contiene datos del usuario': (r) => r.json().userName !== undefined,
        'Orquestacion exitosa (purchases)': (r) => Array.isArray(r.json().purchases),
    });

    // Simulación del tiempo de pensamiento del usuario (1 segundo de pausa)
    sleep(1);
}
