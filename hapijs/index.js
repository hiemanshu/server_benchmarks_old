'use strict'

const Glue = require('glue');
const Manifest = require('./config/manifest.js');
const Options = {
    relativeTo: __dirname
};

Glue.compose(Manifest, Options, (err, server) => {
    if ( err ) throw err;

    server.start((err) => {
        if ( err ) throw err;
        console.info('server running at ' + server.info.uri);
    });
});
