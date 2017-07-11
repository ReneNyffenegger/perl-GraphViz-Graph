package GraphViz::Graph::Node;

use warnings;
use strict;
use 5.10.0; # state
use Carp;


sub new { #_{

  my $class = shift;
  my $opts  = shift;
  my $self = {};


# croak 'Options expected'       unless defined $opts;
# croak 'Options must be a HASH' unless ref $opts eq 'HASH';

# croak "Unrecognized opts " . join "/", keys %$opts if keys %$opts;

  state $id = 0;
  $self->{id} = sprintf('nd_%04d',  ++$id);
  $self->{shape} = 'none';

  bless $self, $class;

  $self->shape('none');
  return $self;

} #_}

sub label { #_{

  my $self = shift;
  my $opts = shift;

  $self->{label} = GraphViz::Graph::Label->new($opts);

} #_}

sub shape { #_{

  my $self       = shift;
  my $shape_text = shift; # none, point, rect, square, star etc // TODO: record

  $self->{shape_text} = $shape_text;

  return $self;

} #_}

sub dot_text { #_{

  my $self = shift;

  my $ret = "  $self->{id} [\n";
  $ret .= "    shape=" . $self->{shape_text} . "\n";

  if (exists $self->{label}) {
      $ret .= "    " . $self->{label}->dot_text();
  }
  $ret .= "  ];\n\n";
  return $ret;

} #_}

'tq84';
