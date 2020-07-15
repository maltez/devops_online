'use strict';

const express = require('express');

// константы
const port = 8080;
const host = '0.0.0.0';
// приложение
const app = express();
app.get('/', (req, res) => {
  res.send('This source code was stolen from internet, because Im not a PROGRAMMER ¯\_(ツ)_/¯');
});

app.listen(port, host);
console.log(`running on http://${host}:${port}`);
