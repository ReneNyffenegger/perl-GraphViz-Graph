package GraphViz::Graph::Edge;
#_{ Use
use warnings;
use strict;

use Carp;
use GraphViz::Graph;
#_}
#_{ Version
our $VERSION = 0.04;
#_}
#_{ Methods
#_{ POD
=head1 METHODS

=cut
#_}
sub new { #_{
#_{ POD
=head2 new

    my $node_from = GraphViz::Graph::Node->new(…);
    my $node_to   = GraphViz::Graph::Node->new(…);

    my $edge = GraphViz::Graph::Edge->new($node_from, $node_to);

Creates an edge between two nodes.

The user of L<< GraphViz::Graph >> should not use this method but rather
call L<< $graph->edge($node_from, $node_to)|GraphViz::Graph/edge >> instead.


=cut
#_}

  my $class = shift;
  my $from  = shift;
  my $to    = shift;

# my $opts  = shift;
  my $self = {};

  $self->{from} = GraphViz::Graph::node_or_port_to_string_($from);
  $self->{to  } = GraphViz::Graph::node_or_port_to_string_($to  );

  bless $self, $class;
  return $self;

} #_}
sub label { #_{

#_{ POD
=head2 arrow_end

    $edge->label('some text');

Sets the L<< label|GraphViz::Graph::Label >> of an edge.

TODO: L<Even more arrow shapes|http://www.graphviz.org/doc/info/arrows.html>

=cut
#_}

  my $self = shift;
  my $opts = shift;
  $self->{label} = GraphViz::Graph::Label->new($opts);

} #_}
sub arrow_end { #_{

#_{ POD
=head2 arrow_end

    $edge_one->arrow_end('normal');
    $edge_two->arrow_end('none');

Sets the shape of the edge's end. L<Possible values|http://www.graphviz.org/doc/info/attrs.html#k:arrowType>.
Technically, it sets the L<arrowhead|http://www.graphviz.org/doc/info/attrs.html#a:arrowhead> attribute. But because C<head> is
confusing, the method is named C<arrow_end>.

TODO: L<Even more arrow shapes|http://www.graphviz.org/doc/info/arrows.html>

=cut
#_}

  my $self  = shift;
  my $arrow = shift;
  $self->{arrow}->{head}=$arrow;

} #_}
sub arrow_start { #_{

#_{ POD
=head2 arrow_start

    $edge_one->arrow_start('normal');
    $edge_two->arrow_start('none'  );

Sets the shape of the edge's start. L<Possible values|http://www.graphviz.org/doc/info/attrs.html#k:arrowType>.

=cut
#_}

  my $self  = shift;
  my $arrow = shift;
  $self->{arrow}->{tail}=$arrow;

} #_}
sub dot_text { #_{
#_{ POD
=head2 dot_text

Returns the dot-text that represents the edge on which it was called.

Called by L<GraphViz::Graph>'s C<write_dot()>.

=cut
#_}

  my $self = shift;

  my $arrow_head = $self->{arrow}->{head} // '';
  my $arrow_tail = $self->{arrow}->{tail} // '';

  my @attributes;

# Apparently, if arrowtail is set, it also needs 'dir=both'
  push @attributes, "dir=both"              if $arrow_tail ;#or $arrow_tail;
  push @attributes, "arrowhead=$arrow_head" if $arrow_head;
  push @attributes, "arrowtail=$arrow_tail" if $arrow_tail;
  push @attributes, $self->{label}->dot_text() if $self->{label};

  my $attributes=join ' ', @attributes;
  $attributes = " [$attributes]" if $attributes;

  my $ret = "$self->{from} -> $self->{to}$attributes;\n";

  return $ret;
} #_}

#_}

'tq84';
