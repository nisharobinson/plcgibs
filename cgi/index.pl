#!/usr/bin/perl -T

use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use FindBin qw($Bin);
BEGIN { ($FindBin::Bin) = ($FindBin::Bin =~ m{^([\w\-/]+)$}) or die "FindBin is tainted"; }

use lib "$FindBin::Bin/../lib";
use common;
use home;
use not_found;
use multiscreen_example;

my $q = common::cgi();

my %page = (
	'home'			=> \&home::go,
	'not_found'		=> \&not_found::go,
	'multiscreen_example'	=> \&multiscreen_example::go,
);

my $param = $q->url_param("page");

if ($param ne "") {
	if (not $param =~ m{^([\w\-]+)$}) {
		die "Parameter page is tainted";
	}
	if (exists $page{$param}) {
		$page{$param}->();
	}
	else {
		$page{'not_found'}->();
	}
}
else {
	$page{'home'}->();
}

1;

