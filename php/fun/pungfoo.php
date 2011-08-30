<?php

Pungfoo::$path = "/products";

function match($route, $handler)
{
	if ($route == Pungfoo::$path) {
		$body = $handler();
		if (is_array($body)) {
			echo $body[0];
			echo "\n";
			echo $body[1];
			echo "\n";
		} else {
			echo $body;
			echo "\n";
		}
	}
}

class Pungfoo
{
	public static $path;
}
