package AtomicFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 59 }, $class;
}

sub load_context {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 59) % 997;
    }
    return $value;
}

print AtomicFactory->new->load_context(59), "\n";
1;
