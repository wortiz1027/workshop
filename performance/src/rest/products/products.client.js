import http from 'k6/http';

export class ProductsClient {
    // 1. GET ALL: Obtener todo el catálogo
    static getAll(baseUrl) {
        const url = `${baseUrl}/api/products`;
        const params = { headers: { 'Accept': 'application/json' } };
        return http.get(url, params);
    }

    // 2. GET BY ID: Obtener un producto específico
    static getById(baseUrl, productId) {
        const url = `${baseUrl}/api/products/${productId}`;
        const params = { headers: { 'Accept': 'application/json' } };
        return http.get(url, params);
    }

    // 3. POST: Crear un nuevo producto en el catálogo
    static create(baseUrl, productData) {
        const url = `${baseUrl}/api/products`;
        const payload = JSON.stringify(productData); // Convertimos el objeto a JSON String
        const params = {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
            },
        };
        return http.post(url, payload, params);
    }

    // 4. DELETE: Eliminar un producto del inventario
    static delete(baseUrl, productId) {
        const url = `${baseUrl}/api/products/${productId}`;
        return http.del(url); // Módulo nativo .del() de k6 para operaciones DELETE
    }
}