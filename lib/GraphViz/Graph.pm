
 #_{ Encoding and name
=encoding utf8
=head1 NAME
GraphViz::Graph - Object Oriented Interface to graphviz.
=cut
package GraphViz::Graph;

use strict;
use warnings;
use utf8;
 #_}
 #_{ Version
=head1 VERSION
Version 0.01
=cut

our $VERSION = '0.01';
#_}
 #_{ Synopsis
=head1 SYNOPSIS
    use GraphViz::Graph;
   
=cut
#_}


sub new {

  my $class = shift;
  my $self = {};

  bless $self, $class;

  return $self;

}


'tq84'
