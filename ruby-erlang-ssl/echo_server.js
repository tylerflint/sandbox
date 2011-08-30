var net = require('net');

var server = net.createServer(function (c) {
  c.pipe(c);
});
server.listen(1800, 'localhost');