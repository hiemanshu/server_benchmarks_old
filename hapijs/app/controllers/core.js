'use strict';

const Boom = require('boom');

exports.index = {
    description: 'index page',
    handler: (request, reply) => {
        reply('Hello, world!');
    }
};

exports.fortunesJSON = {
    description: 'returns a JSON representation of the fortunes',
    handler: (request, reply) => {
        request.pg.client.query('select * from fortunes', (err, result) => {
            if ( err ) {
                reply(Boom.wrap(err, 500));
            }
            reply(result.rows);
        });
    }
};
    
exports.fortunes = {
    description: 'generates fortunes page',
    handler: (request, reply) => {
        request.pg.client.query('select * from fortunes', (err, result) => {
            if ( err ) {
                reply(Boom.wrap(err, 500));
            }
            reply.view('fortunes', { fortunes: result.rows });
        });
    }
};
