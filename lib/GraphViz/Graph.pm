
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
  my $opts  = shift;

  my $self = {};

  die 'missing file_base_name' unless $opts->{file_base_name};
  $self -> {file_base_name} = delete $opts->{file_base_name};

  die "Unrecognized opts" if keys %$opts;

  bless $self, $class;

  return $self;

}

sub write_dot {

  my $self = shift;
  open my $out, '>', $self->{file_base_name};

}


'tq84'
