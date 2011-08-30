var tls = require('tls');
var fs = require('fs');

var options = {
  key: fs.readFileSync('key.pem'),
  cert: fs.readFileSync('cert.pem')
};

tls.createServer(options, function (s) {
	s.connect(function(){
		console.log("connected");
	});
  // s.write("welcome!\n");
	s.pipe(s);
}).listen(1801);