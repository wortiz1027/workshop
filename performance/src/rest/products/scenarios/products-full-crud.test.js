import { check, sleep } from 'k6';
import crypto from 'k6/crypto'; // Módulo de criptografía nativo de k6
import { ProductsClient } from '../products.client.js';
import { getSelectedEnv } from '../../../../config/environments.js';

// Configuración de carga progresiva moderada para validar flujos lógicos
export const options = {
    stages: [
        { duration: '15s', target: 5 },  // Subida inicial a 5 usuarios concurrentes
        { duration: '30s', target: 15 }, // Estabilidad a 15 usuarios concurrentes
        { duration: '15s', target: 0 },  // Descenso
    ],
};

const currentEnv = getSelectedEnv();

export default function () {
    // ---- FLUJO 1: Consultar lista completa (GET ALL) ----
    const resGetAll = ProductsClient.getAll(currentEnv.products_url);
    check(resGetAll, {
        'GET ALL - Status es 200': (r) => r.status === 200,
    });

    // ---- FLUJO 2: Consultar un ID específico (GET BY ID) ----
    // Usamos el ID de la PS5 inyectado por defecto en el script SQL de inicialización
    const targetId = '4b97dc13-6382-4db0-961a-fdc1bd810599';
    const resGetById = ProductsClient.getById(currentEnv.products_url, targetId);
    check(resGetById, {
        'GET BY ID - Status es 200': (r) => r.status === 200,
        'GET BY ID - Coincide Nombre': (r) => r.json().name === 'Play Station 5',
    });

    // ---- FLUJO 3: Crear un producto único (POST) ----
    // Generamos datos variables en cada iteración para evitar colisiones en la llave primaria de MySQL
    const uniqueId = crypto.randomUUID().substring(0, 8); 
    const newProduct = {
        id: `prod-${uniqueId}`,
        code: `COD-${uniqueId.toUpperCase()}`,
        name: `Producto K6 ${uniqueId}`,
        description: 'Generado de forma automatica en pruebas de rendimiento',
        price: 150000.00
    };

    const resCreate = ProductsClient.create(currentEnv.products_url, newProduct);
    check(resCreate, {
        'POST - Status es 201': (r) => r.status === 201,
        'POST - ID guardado correctamente': (r) => r.json().id === newProduct.id,
    });

    // Petición de cortesía simulando el tiempo de navegación antes del siguiente ciclo
    sleep(1);
}
