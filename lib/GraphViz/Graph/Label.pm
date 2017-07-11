package GraphViz::Graph::Label;

use warnings;
use strict;

use Carp;

sub new { #_{

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
      croak "A label must be either a text or a html label";
  }

  croak "Unrecognized opts " . join "/", keys %$opts if keys %$opts;

  bless $self, $class;
  return $self;

} #_}

sub dot_text { #_{

  my $self = shift;

  if ($self->{type} eq 'text') {

     return "
  label=\"$self->{text_or_html}\"
";

  }
  else {
     return "
  label=<$self->{text_or_html}>
";

  }

} #_}

'tq84';
