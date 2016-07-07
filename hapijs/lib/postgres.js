'use strict';

exports.register = (server, options, next) => {

    let plugin = {
        register: require('hapi-node-postgres'),
        options: options
    }

    server.register(plugin, (err) => {
        if ( err ) {
            console.log('error loading "hapi-node-postgres" plugin');
        }
    });
    next();
};

exports.register.attributes = {
    name: 'postgres adapter',
    version: require('../package.json').version
};
