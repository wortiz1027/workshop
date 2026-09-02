import http from 'k6/http';

export class UsersClient {
    
    // Método para obtener el reporte agregado de un usuario por su ID
    static getReport(baseUrl, userId) {
        const url = `${baseUrl}/api/users/${userId}/report`;
        const params = {
            headers: {
                'Accept': 'application/json',
            },
        };
        
        // k6 ejecuta la petición HTTP GET de forma síncrona
        return http.get(url, params);
    }
}
