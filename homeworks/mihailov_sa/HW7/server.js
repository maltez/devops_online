'use strict';

const express = require('express');

// константы
const port = 8080;
const host = '0.0.0.0';

//переменная из VAULT ==> ENV
const passwd = process.env.PASS;

// приложение
const app = express();
app.get('/', (req, res) => {
  res.send('This ==>  ::${passwd}  <==  bullshit doesn\'t work, beacause IM NOT A PROGRAMMER, but env var was passed to image:)');
});

app.listen(port, host);
console.log(`running on http://${host}:${port}`);
