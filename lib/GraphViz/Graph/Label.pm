package GraphViz::Graph::Label;

sub new { #_{

  my $class = shift;
  my $opts  = shift;
  my $self = {};

  if ($opts->{text}) {
    $self->{text} = delete $opts->{text};
  }

  bless $self, $class;
  return $self;

} #_}

sub dot_text {

  my $self = shift;
  return "
  label=\"$self->{text}\"
";

}

'tq84';
