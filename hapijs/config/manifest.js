'use strict';

module.exports = {
    connections: [{
        host: 'localhost',
        port: 8000
    }],
    registrations: [{
        plugin: 'vision'
    }, {
        plugin:{
            register: 'visionary',
            options: {
                engines: {
                    hbs: 'handlebars',
                },
                path: './app/templates'
            }
        }
    }, {
        plugin: {
            register: './lib/postgres.js',
            options: {
                connectionString: ''
            }
        }
    }, {
        plugin: './app/routes/core.js'
    }]
};
