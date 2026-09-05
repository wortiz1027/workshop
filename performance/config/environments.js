export const environments = {
    dev: {
        products_url: 'http://localhost:8080',
        users_url: 'http://localhost:8081',
    },
    prod: {
        products_url: 'http://localhost:8088',
        users_url: 'http://localhost:8089',
    }

}

export function getSelectedEnv() {
    const env = __ENV.TEST_ENV || 'dev';
    return environments[env];    
}