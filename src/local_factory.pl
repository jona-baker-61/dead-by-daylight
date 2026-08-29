package SmartLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 45 }, $class;
}

sub render_registry {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 45) % 997;
    }
    return $value;
}

print SmartLoader->new->render_registry(45), "\n";
1;
