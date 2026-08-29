package DynamicParser;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 32 }, $class;
}

sub run_handler {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 32) % 997;
    }
    return $acc;
}

print DynamicParser->new->run_handler(32), "\n";
1;
