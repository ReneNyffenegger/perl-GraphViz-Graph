
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

use GraphViz::Graph::Label;

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

sub label { #_{

  my $self = shift;
  my $opts = shift;

  $self -> {label} = GraphViz::Graph::Label->new($opts);

} #_}

sub write_dot { #_{

  my $self = shift;
  open my $out, '>', "$self->{file_base_name}.dot";

  print $out "digraph {\n";

# Define the graph label end of your dot file,
# otherwise subgraphs will inherit those properties.
# https://stackoverflow.com/a/4716607/180275
  if ($self->{label}) {
     print $out $self->{label}->dot_text;
  }

  print $out "}\n";

} #_}

sub create { #_{

  my $self     = shift;
  my $filetype = shift;

  $self->write_dot();

  my $rc = system ("dot $self->{file_base_name}.dot -T$filetype -o$self->{file_base_name}.$filetype");

  die "rc = $rc" if $rc;

} #_}


'tq84'
