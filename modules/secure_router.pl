package DynamicDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 9 }, $class;
}

sub dispatch_scheduler {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 9) % 997;
    }
    return $result;
}

print DynamicDispatcher->new->dispatch_scheduler(9), "\n";
1;
