'use strict';

module.exports = {
    connections: [{
        host: 'localhost',
        port: 8000
    }],
    registrations: [{
        plugin: './app/routes/core.js'
    }]
};
