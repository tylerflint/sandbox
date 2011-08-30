<?php

$pung = new PungFoo('cow');

$pung->match("/", function(){
	
	echo "I am the anonymous function \n";
	echo "I am app: {$this->_app} \n";
	
});

echo "\n";


class PungFoo
{
	
	protected $_app;
	
	public function __construct($app)
	{
		$this->_app = $app;
	}
	
	public function match($route, $action)
	{
		echo "matching: $route \n";
		$action();
	}
}
