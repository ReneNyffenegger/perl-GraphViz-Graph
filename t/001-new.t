#!/usr/bin/perl
use warnings;
use strict;

use Test::More tests => 3;
use Test::Exception;

use GraphViz::Graph;

dies_ok { GraphViz::Graph->new } 'Expecting to die';

my $graph = GraphViz::Graph->new({file_base_name=>'test'});

is(ref $graph, 'GraphViz::Graph', 'ref() of thing returned by new');

dies_ok { GraphViz::Graph->new({unrecognized_parameter=>'test'}) } 'passing an unrecognized_parameter should die';
