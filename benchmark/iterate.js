var mongodb = require('mongodb');

// var client = new Db('pagoda_production', new Server("184.172.8.6", 27017), {native_parser:true});
// client.bson_serializer.Long
// client.bson_serializer.ObjectID
// client.bson_serializer.Timestamp
// client.bson_serializer.DBRef
// client.bson_serializer.Binary
// client.bson_serializer.Code

var start = new Date();

var count = 0;

var mongobd_server = new mongodb.Server("127.0.0.1", 27017);
new mongodb.Db("pagoda_production", mongobd_server, {}).open(function (error, client){
	console.log("connection established");
	
	new mongodb.Collection(client, "web_transactions").find({"an":"klondikebrands"}, {'batchSize': 100000, 'hint': true, 'explain': true}).each(function (error, transaction){
		console.log(transaction);
		if(transaction) {
			count += 1;
			// console.log(count);
		}else{
			stop = new Date();
			console.log(count);
		}
	});
});