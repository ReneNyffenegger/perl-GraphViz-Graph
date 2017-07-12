package GraphViz::Graph::Edge;

use warnings;
use strict;

use GraphViz::Graph;

use Carp;

#_{ Methods

=head1 METHODS
=cut

sub new { #_{
#_{ POD
=head2 new
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
sub dot_text {
#_{ POD
=head2 dot_text
=cut
#_}

  my $self = shift;

  my $ret = "$self->{from} -> $self->{to};\n";

  return $ret;

}

#_}

'tq84';
