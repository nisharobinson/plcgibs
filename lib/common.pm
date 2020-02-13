#!/usr/bin/perl

use strict;
use warnings;

package common;

use CGI qw();
use HTML::Template qw();
use FindBin qw($Bin);

use lib "$FindBin::Bin/../lib";

sub cgi {
	# @_
	my ($hash) = @_;
	return CGI->new($hash);
}

sub template {
	# @_
	my ($hash) = @_;
	$hash->{'path'} = "$FindBin::Bin/../tmpl/";
	$hash->{'filter'} = sub {
		my ($t_ref) = @_;
		$$t_ref =~ s/^\s+//mg;
	};
	return HTML::Template->new(%{$hash});
}

sub main_page {
	# @_
	my ($hash) = @_;
	my $q = cgi();
	if (ref $hash->{'template'} ne "HTML::Template") {
		die "Not a template";
	}
	my $content = $hash->{'template'}->output();
	chomp($content);
	my $t = template({filename => "main.tmpl"});
	$t->param(title => "Perl CGI Bootstrap v1.0");
	$t->param(content => $content);
	print $q->header("text/html;charset=UTF-8"), $t->output();
	return;
}

1;

