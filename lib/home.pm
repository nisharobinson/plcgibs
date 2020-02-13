#!/usr/bin/perl

use strict;
use warnings;

package home;

use HTML::Template qw();
use FindBin qw($Bin);

use lib "$FindBin::Bin/../lib";
use common;

sub go {
	my $t = common::template({ filename => "home.tmpl"});
	common::main_page({ template => $t });
	return;
}

1;

