const { createServer } = require('http');

const server = createServer((req, res) => {
    console.log(`Request from [${req.method}]:${req.url}`);
    if(req.url === "/err"){
        return;
    }

    res.statusCode = 200;
    res.write(`Hello VasCos from ${req.url}`);
    res.end();
});

const PORT = process.env.PORT;
const HOST = process.env.HOST;

server.listen(PORT, HOST, () => {
    console.log(`Server listen on ${HOST}:${PORT}`);
});
