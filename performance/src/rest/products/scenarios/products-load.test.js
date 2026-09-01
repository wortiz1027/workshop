import { check, sleep } from 'k6';
import { ProductsClient } from '../products.client.js';
import { getSelectedEnv } from '../../../../config/environments.js';

export const options = {
    stages: [
        { duration: '20s', target: 10 },
        { duration: '40s', target: 10 },
        { duration: '20s', target: 30 },
        { duration: '40s', target: 30 },
        { duration: '10s', target: 0 },
    ],
};

const currentEnv = getSelectedEnv();

export default function() {
    const response = ProductsClient.getAll(currentEnv.products_url);

    check(response, {
        'status is 200?': (r) => r.status === 200,
        'tiempo de respuesta menor a 500ms?': (r) => r.timings.duration < 500,
    });

    sleep(1);
}