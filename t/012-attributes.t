#!/usr/bin/perl
use warnings;
use strict;

use GraphViz::Graph;

use Test::More tests => 1;

my $file_base_name = 'test-012';
my $dot_file_name  = "$file_base_name.dot";
my $png_file_name  = "$file_base_name.png";
my $graph = GraphViz::Graph->new($file_base_name);

my $nd_a = $graph->node();
my $nd_b = $graph->node();
my $nd_c = $graph->node();

$nd_a -> label({text=>'A'});
$nd_b -> label({text=>'B'});
$nd_c -> label({text=>'C'});

my $e_ab = $graph->edge($nd_a, $nd_b);
my $e_ac = $graph->edge($nd_a, $nd_c);

$e_ab->set_attribute('color'   , 'red');
$e_ab->set_attribute('penwidth', '4');

$graph->create('png');

ok('ok for the time being');
