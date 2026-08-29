package SmartAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 85 }, $class;
}

sub run_service {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 85) % 997;
    }
    return $count;
}

print SmartAdapter->new->run_service(85), "\n";
1;
