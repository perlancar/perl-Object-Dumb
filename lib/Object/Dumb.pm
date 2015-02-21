package Object::Dumb;

# DATE
# VERSION

sub new { my $o = ""; bless \$o, shift }
sub AUTOLOAD { 0 }

1;
# ABSTRACT: A dumb object that does nothing when you call any of its methods

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Object::Dumb;

 my $obj = Object::Dumb->new;
 $obj->foo;          # -> 0
 $obj->bar(1, 2, 3); # -> 0


=head1 DESCRIPTION


=head1 SEE ALSO

=cut
