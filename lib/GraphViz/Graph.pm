
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
#_{ Testing
=head1 Testing

The tests need L<Test::Files|http://search.cpan.org/search?query=Test%3A%3AFiles&mode=all>.

=cut
#_}


sub new { #_{

  my $class = shift;
  my $opts  = shift;

  my $self = {};

  die 'missing file_base_name' unless $opts->{file_base_name};
  $self -> {file_base_name} = delete $opts->{file_base_name};

  die "Unrecognized opts" if keys %$opts;

  bless $self, $class;

  return $self;

} #_}

sub write_dot { #_{

  my $self = shift;
  open my $out, '>', "$self->{file_base_name}.dot";

  print $out "digraph {\n";

  print $out "}\n";

} #_}

sub create {

  my $self     = shift;
  my $filetype = shift;

  $self->write_dot();

  my $rc = system ("dot $self->{file_base_name}.dot -T$filetype -o$self->{file_base_name}.$filetype");

  die "rc = $rc" if $rc;

}


'tq84'
