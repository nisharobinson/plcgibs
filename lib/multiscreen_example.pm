#!/usr/bin/perl

use strict;
use warnings;

package multiscreen_example;

use FindBin qw($Bin);

use lib "$FindBin::Bin/../lib";
use common;

my $q = common::cgi();

sub go {
	my $t = common::template({ filename => "multiscreen-example.tmpl" });
	$t->param(_state => $q->param("_state") || "One");
	common::main_page({ template => $t });
	return;
}

1;

