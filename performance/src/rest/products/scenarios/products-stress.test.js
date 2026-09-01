import { check } from 'k6';
import { ProductsClient } from '../products.client.js';
import { getSelectedEnv } from '../../../../config/environments.js'

export const options = {
    stages: [
        { duration: '20s', target: 50 },
        { duration: '40s', target: 150 },
        { duration: '40s', target: 300 },
        { duration: '10s', target: 0 },
    ],
}

const currentEnv = getSelectedEnv();

export default function() {
    const response = ProductsClient.getAll(currentEnv.products_url);

    check(response, {
        'HTTP 200 OK (Procesado)': (r) => r.status === 200,
        'HTTP 500 (Error Interno/JVM)': (r) => r.status === 500,
        'HTTP 502/504 (Contenedor Caido/Timeout)': (r) => r.status >= 502,
    })
}