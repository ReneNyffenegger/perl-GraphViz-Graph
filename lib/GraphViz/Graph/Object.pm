#_{ Encoding and name
=encoding utf8

=head1 NAME

GraphViz::Graph::Object - Base class for L<<GraphViz::Graph>>, L<<nodes|GraphViz::Graph::Node>>
and L<<edges|GraphViz::Graph::Edge>>.

=cut

package GraphViz::Graph::Object;

use strict;
use warnings;
use utf8;
#_}
#_{ Version
=head1 VERSION

Version 0.04

=cut

our $VERSION = 0.04;
#_}
#_{ Synopsis
=head1 SYNOPSIS


C<< GraphViz::Graph::Object >> should not be used directly by an enduser.

=cut
#_}
#_{ use …

use Carp;

#_}
#_{ Methods
=head1 METHODS
=cut

sub new { #_{
#_{ POD

=head2 new

    my $obj = GraphViz::Graph::Object->new();

Initalize a GraphViz::Graph object.

=cut

  my $class          = shift;
  my $self           = {};

  bless $self, $class;
  return $self;

} #_}
sub set_attribute { #_{
#_{ POD
=head2 dot_text

    $attributes->set_attribute('name', $key);

=cut
#_}
  
  my $self  = shift;
  my $name  = shift;
  my $value = shift;
  
  $self->{attributes}{$name}=$value;

} #_}
sub dot_text_attributes { #_{
#_{ POD
=head2 dot_text

Returns the dot-text that represents the attributes stored in C<$self>.

=cut
#_}

  my $self = shift;

  my $attributes = '';

  for my $key (keys %{$self->{attributes}}) {

    $attributes .= ' ' if $attributes;
    $attributes .= "$key = \"$self->{attributes}{$key}\"";
  }

  return $attributes;

} #_}

#_}
#_{ POD: Copyright

=head1 Copyright

Copyright © 2017 René Nyffenegger, Switzerland. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at: L<http://www.perlfoundation.org/artistic_license_2_0>

=cut

#_}
#_{ Source Code

=head1 Source Code

The source code is on L<github|https://github.com/ReneNyffenegger/perl-GraphViz-Graph>. Meaningful pull requests are welcome.

=cut

#_}

'tq84'

