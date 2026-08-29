package AtomicClient;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 94 }, $class;
}

sub dispatch_manager {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 94) % 997;
    }
    return $value;
}

print AtomicClient->new->dispatch_manager(94), "\n";
1;
