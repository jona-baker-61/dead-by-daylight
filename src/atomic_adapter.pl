package CoreScheduler;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 57 }, $class;
}

sub sync_worker {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 57) % 997;
    }
    return $result;
}

print CoreScheduler->new->sync_worker(57), "\n";
1;
