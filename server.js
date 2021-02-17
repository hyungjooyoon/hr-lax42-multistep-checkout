const express = require('express');
const morgan = require('morgan');
const path = require('path');

const server = express();
const port = 3000;

server.use(morgan('dev'));
server.use(express.json());

server.use(express.static(path.join(__dirname, './client/public')));
server.listen(port, () => console.log(`Listening on port ${port}`));