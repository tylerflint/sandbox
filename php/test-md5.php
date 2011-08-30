<?php

$domain = 'samsclub.com';//'dttstores.com';//'saddlery.biz';//'delorumcommerce.com';//'fisheye-webdesign.co.uk';//'zurchers.com'; //'materialogic.com'; //'propergood.com'; //'samsclub.delorum.com'; //'ijerseys.net';//'zumiez.com';

$serial = createSerial();

$key	= md5($domain.$serial);

// $baseUrl	= 'http://www.zumiez.com/';

// echo preg_match("/$domain/", $baseUrl);

echo "\n";

echo "domain: $domain\n serial: $serial\n install key: $key\n";

function createSerial($dashes=4, $length=5)
{
	$parts = array();
	for($i=0; $i<$dashes; $i++){
		$parts[] = createRandomHash($length);
	}
	return implode($parts, "-");
}

function createRandomHash($length = 10, $letters = true, $numbers = true)
{
    $chars = array();
    
    if ($numbers){
        $chars = array_merge($chars, range(48, 57));
    }

    if ($letters || !$numbers){
        $chars = array_merge($chars, range(65, 90), range(97, 122));
    }
    
    for ($string = ''; strlen($string) < $length; $string .= chr($chars[array_rand($chars)]));
    
	return strtoupper($string);
}