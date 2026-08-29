package LocalService;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 76 }, $class;
}

sub dispatch_client {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 76) % 997;
    }
    return $count;
}

print LocalService->new->dispatch_client(76), "\n";
1;
