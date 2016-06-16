package Object::Dumb;

# DATE
# VERSION

#use strict;
#use warnings;

sub new {
    my $class = shift;
    my $o = {@_};

    $o->{returns} = 0 if !exists($o->{returns});
    bless $o, $class;
}

sub AUTOLOAD {
    my $meth = $AUTOLOAD; $meth =~ s/.+:://;
    my $self = shift;
    if ($self->{methods}) {
        my $known = 0;
        if (ref($self->{methods}) eq 'ARRAY') {
            $known = 1 if grep { $_ eq $meth } @{ $self->{methods} };
        } elsif (ref($self->{methods}) eq 'Regexp') {
            $known = 1 if $meth =~ $self->{methods};
        }
        die "Unknown method '$meth'" unless $known;
    }
    return $self->{returns};
}

1;
# ABSTRACT: A dumb object that responds to any method and just returns 0

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Object::Dumb;

 my $obj = Object::Dumb->new;
 $obj->foo;          # -> 0
 $obj->bar(1, 2, 3); # -> 0

You can limit what methods will be available:

 my $obj = Object::Dumb->new(methods => [qw/foo bar/]);
 $obj->foo; # ok
 $obj->bar; # ok
 $obj->baz; # dies

or:

 my $obj = Object::Dumb->new(methods => qr/^(foo.*|bar.+)$/);
 $obj->foo;  # ok
 $obj->barb; # ok
 $obj->baz;  # dies

And you can also customize what value the methods will return:

 my $obj = Object::Dumb->new(returns => 1);
 print $obj->foo; # 1


=head1 DESCRIPTION

This module lets you create a "dumb" object that responds to any method and just
returns 0.

You can customize by limiting what methods the object will respond to, and what
value the methods will return.


=head1 SEE ALSO

=cut
