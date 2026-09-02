import { check } from 'k6';
import { UsersClient } from '../users.client.js';
import { getSelectedEnv } from '../../../../config/environments.js';

// 1. CONFIGURACIÓN DE CARGA EXTREMA DE ESTRÉS (Stress / Breakpoint)
export const options = {
    stages: [
        { duration: '20s', target: 50 },  // Fase 1: Presión inicial rápida (0 a 50 usuarios virtuales)
        { duration: '40s', target: 150 }, // Fase 2: Saturación de la red interna (Subir a 150 usuarios)
        { duration: '40s', target: 300 }, // Fase 3: Punto de quiebre distribuido (Masivo a 300 usuarios)
        { duration: '10s', target: 0 },   // Fase 4: Descenso
    ],
};

const currentEnv = getSelectedEnv();

// 2. LÓGICA DE BOMBARDEO DISTRIBUIDO (Sin Sleep para máxima asfixia)
export default function () {
    // Atacamos el reporte unificado del usuario base
    const response = UsersClient.getReport(currentEnv.users_url, 'usr-0001');

    // Registramos la degradación del ecosistema completo durante el colapso en cascada
    check(response, {
        'HTTP 200 OK (Reporte Agregado)': (r) => r.status === 200,
        'HTTP 500 (Fallo Interno en Java)': (r) => r.status === 500,
        'HTTP 502/504 (Timeout Orquestador / Caida)': (r) => r.status >= 502,
    });
}
