import http from 'k6/http';

export class SimulatorClient {
    
    // Método para obtener el reporte agregado de un usuario por su ID
    static getReport(baseUrl) {
        const url = `${baseUrl}/api/v1/simulator/stress`;
        const params = {
            headers: {
                'Accept': 'application/json',
            },
        };
        
        // k6 ejecuta la petición HTTP GET de forma síncrona
        return http.get(url, params);
    }
}