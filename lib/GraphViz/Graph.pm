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

use Carp;
use GraphViz::Graph::Label;

#_{ Methods
=head1 METHODS
=cut

sub new { #_{

=head2 new
    my $graph = GraphViz::Graph->new('FileNameBase');

Start a graph. C<'FileNameBase'> is the base name for the produced dot and png/pdf/svg… etc. output file.
=cut

  my $class          = shift;
  my $file_base_name = shift;
  my $opts           = shift // {};

  my $self           = {};

  croak 'File base name must be passed' unless defined $file_base_name;
  croak 'File base name must be sclar'  unless ref \$file_base_name eq 'SCALAR';

  $self -> {file_base_name} = $file_base_name;

# $opts->{file_base_name} = $file_base_name;

  croak "Unrecognized opts " . join "/", keys %$opts if keys %$opts;

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

  croak "unspecified filetype" unless $filetype;

  $self->write_dot();

  my $command = "dot $self->{file_base_name}.dot -T$filetype -o$self->{file_base_name}.$filetype";

  my $rc = system ($command);

  croak "rc = $rc, command=$command" if $rc;

} #_}

#_}

'tq84'
