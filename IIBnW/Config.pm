package IIBnW::Config;

use Config::Tiny;

sub new {
    my $class = shift;

    my $self = { _file => shift, };

    bless $self, $class;
    return $self;
}

# Load configuration
sub load {
    my ($self) = @_;
    my $file = $self->{_file};
    
    my $tiny = Config::Tiny->new();
    $config = $tiny->read($file);
    
    return $config;
}

# Reload configuration
sub reload {
    my ($self) = @_;

    my $c = IIBnW::Config->new();
    my $config = $c->load();

    return $config;
}

1;
