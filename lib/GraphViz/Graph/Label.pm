package GraphViz::Graph::Label;
#_{ use
use warnings;
use strict;

use Carp;
#_}
#_{ Version
our $VERSION = 0.04;
#_}
#_{ Methods
#_{ POD
=encoding utf8

=head1 METHODS

=cut

 #_}
sub new { #_{
 #_{ POD
=head2 new


    my $label_text = GraphViz::Graph::Label->new({
       text => 'foo bar baz'
    });

    my $label_html = GraphViz::Graph::Label->new({
       html => 'foo <b>bar</b> <i>baz</i>'
    });

Creates a text or html label, depending on the option passed in the argument. The text is assumed to be in utf8.

This method should not be used by the user of L<< GraphViz::Graph >>, rather, she should use
L<< $edge->label(…)|GraphViz::Graph::Edge/label >>, 
L<< $node->label(…)|GraphViz::Graph::Node/label >> or
L<< $graph->label(…)|GraphViz::Graph/label >>.

=cut
 #_}
  my $class = shift;
  my $opts  = shift;
  my $self = {};

  croak 'Options expected'       unless defined $opts;
  croak 'Options must be a HASH' unless ref $opts eq 'HASH';

  if ($opts->{text}) {
      $self->{type} = 'text';
      $self->{text_or_html} = delete $opts->{text};
  }
  elsif ($opts->{html}) {
      $self->{type} = 'html';
      $self->{text_or_html} = delete $opts->{html};
  }
  else {
      croak "GraphViz::Graph::Label - new: A label must be either a text or a html label";
  }

  croak "Unrecognized opts " . join "/", keys %$opts if keys %$opts;

  bless $self, $class;
  return $self;

} #_}
sub loc { #_{
 #_{ POD
=head2 loc

    my $label = $graph -> label(…);
    $label->loc('t'); # put label to top of graph

For I<graphs and clusters>, only C<"t"> (I<top>)and C<"b"> (I<bottom>, default) are allowed.

Possible values for I<nodes> seem to be C<"t">, C<"b"> and C<"c"> (I<centered>, default). The value is only used when the height of the node is larger than the height of its label. 

=cut
 #_}
  my $self = shift;
  my $loc  = shift;

  carp "$loc is not in c, b, t" unless grep { $_ eq $loc} qw(c b t);

  $self->{loc} = $loc;

  return $self;

} #_}
sub dot_text { #_{
 #_{ POD
=head2 dot_text

=cut
 #_}

  my $self = shift;

  my $ret = '';

  if ($self->{type} eq 'text') {

     $ret = "
  label=\"$self->{text_or_html}\"
";

  }
  else {
     $ret = "
  label=<$self->{text_or_html}>
";

  }
  if ($self->{loc}) {
    $ret .= "  labelloc=$self->{loc}
";
  }

  return $ret;

} #_}

#_}

'tq84';
