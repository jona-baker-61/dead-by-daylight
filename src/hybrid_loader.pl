package HybridWorker;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 12 }, $class;
}

sub parse_provider {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 12) % 997;
    }
    return $value;
}

print HybridWorker->new->parse_provider(12), "\n";
1;
