#!/usr/bin/perl
use warnings;
use strict;

use GraphViz::Graph;

use Test::More tests => 1;
use Test::Files;

my $file_base_name = 'test-011';
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

$e_ab -> label({text=>'A -> B'});
$e_ac -> label({html=>'<font point-size="25" color="#ff7700"><b>A</b></font> -&gt; <i><font color="#0066ff">B</font></i>'});

$graph->create('png');

compare_ok($dot_file_name, "t/$dot_file_name.expected", "dot file should be equal");

unlink $dot_file_name;
unlink $png_file_name;
