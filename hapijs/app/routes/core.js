'use strict';

exports.register = (server, options, next) => {

    let Controllers = {
        core: require('../controllers/core.js')
    };

    server.route([{
        method: 'GET',
        path: '/',
        config: Controllers.core.index
    }]);

    next();
};

exports.register.attributes = {
    name: 'core routes',
    version: require('../../package.json').version
};
