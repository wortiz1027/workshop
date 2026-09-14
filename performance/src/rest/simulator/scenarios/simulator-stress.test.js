import { check, sleep } from 'k6';
import { SimulatorClient } from '../simulator.client.js';
import { getSelectedEnv } from '../../../../config/environments.js';

// 1. CONFIGURACIÓN DE CARGA EXTREMA DE ESTRÉS (Stress / Breakpoint)
export const options = {
    stages: [
        { duration: '15s', target: 15 }, // 📈 Subida Express: De 0 a 15 usuarios en solo 15 segundos
        { duration: '20s', target: 45 }, // 🔥 Pico de Impacto: 45 usuarios derretirán la CPU por 20 segundos
        { duration: '10s', target: 0 },  // 📉 Bajada Instantánea: Desconecta el tráfico en 10 segundos
    ],
    thresholds: {
        http_req_failed: ['rate<0.05'], // Toleramos hasta un 5% de fallos por los Timeouts residuales
    },
};

const currentEnv = getSelectedEnv();

// 2. LÓGICA DE BOMBARDEO DISTRIBUIDO (Sin Sleep para máxima asfixia)
export default function () {
    // Atacamos el reporte unificado del usuario base
    const response = SimulatorClient.getReport(currentEnv.simulator_url);

    // Registramos la degradación del ecosistema completo durante el colapso en cascada
     check(response, {
        'Status es 200 OK': (r) => r && r.status === 200,
        'Procesado por Pod legítimo': (r) => r && r.body && r.body.includes('processedByPod'),
    });

    // Pequeño respiro de 100ms entre ráfagas de cada usuario para no congelar la VM por completo
    sleep(0.1);
}

