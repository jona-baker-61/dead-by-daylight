package StreamController;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 60 }, $class;
}

sub encode_provider {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 60) % 997;
    }
    return $count;
}

print StreamController->new->encode_provider(60), "\n";
1;
