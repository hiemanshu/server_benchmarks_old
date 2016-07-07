'use strict';

exports.register = (server, options, next) => {

    let Controllers = {
        core: require('../controllers/core.js')
    };

    server.route([
    {
        method: 'GET',
        path: '/',
        config: Controllers.core.index
    },
    {
        method: 'GET',
        path: '/fortunes',
        config: Controllers.core.fortunes
    },
    {
        method: 'GET',
        path: '/fortunes.json',
        config: Controllers.core.fortunesJSON
    }
    ]);

    next();
};

exports.register.attributes = {
    name: 'core routes',
    version: require('../../package.json').version
};
