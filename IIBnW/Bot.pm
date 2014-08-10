package IIBnW::Bot;

use strict;
use warnings;

use Net::Jabber::Bot;

use Data::Dumper;

sub new {
    my $class = shift;

    my $config = shift;
    my $bot    = Net::Jabber::Bot->new(
        server              => $config->{server}->{HOST},
        port                => $config->{server}->{PORT},
        username            => $config->{auth}->{USER},
        password            => $config->{auth}->{PASS},
    );
    my $self = { _config => shift, };

    bless $self, $class;
    return $self;
}



1;
