const { createServer } = require('http');
const { OK } = require('http-status-codes');

const HOST = process.env.HOST;
const PORT = process.env.PORT;

const server = createServer(function(req,res){
    console.log(`${req.method}:${req.url}`);
    res.statusCode = OK;
    res.write('Hello Nick');
    res.end();
});

server.listen(PORT, HOST, function(){
    console.log(`server listen on ${HOST}:${PORT}`);
});