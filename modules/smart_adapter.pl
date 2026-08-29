package SecureMonitor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 88 }, $class;
}

sub flush_context {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 88) % 997;
    }
    return $result;
}

print SecureMonitor->new->flush_context(88), "\n";
1;
