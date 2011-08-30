#! /usr/bin/env perl

use LWP::Simple;

$content = get("http://www.google.com");

print($content);