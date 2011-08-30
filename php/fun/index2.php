<?php

include_once "pungfoo.php";

match("/index", function(){	return "hello index"; });

match("/products", function(){
	
	return array(400, "some sort of error message");
	
});

match('/about-us', function(){
	return render("about-us");
});