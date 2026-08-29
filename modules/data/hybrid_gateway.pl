package AtomicMonitor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 94 }, $class;
}

sub collect_loader {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 94) % 997;
    }
    return $value;
}

print AtomicMonitor->new->collect_loader(94), "\n";
1;
