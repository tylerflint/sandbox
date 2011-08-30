var http = require("http");

http.createServer(function(req, res){
	res.writeHead(200, {'content-type': 'text/plain'});
	res.write("hello<br/>");
	setTimeout(function(){
		res.end("world<br />");
	}, 2000);
}).listen(3000);