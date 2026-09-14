export const environments = {
    dev: {
        products_url: 'http://localhost:8080',
        users_url: 'http://localhost:8081',
        simulator_url: 'http://localhost:8080',
    },
    prod: {
        products_url: 'http://localhost:8088',
        users_url: 'http://localhost:8081',
        simulator_url: 'http://workshop.local',
    },
    k8s: {
        products_url: 'http://localhost:8088',
        users_url: 'http://localhost:8081',
        simulator_url: 'http://workshop.local',
    }

}

export function getSelectedEnv() {
    const env = __ENV.TEST_ENV || 'dev';
    return environments[env];    
}