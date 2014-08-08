package IIBnW::Bot;

use strict;
use warnings;

use Net::XMPP;

use Data::Dumper;

sub new {
    my $class = shift;

    my $self = { _config => shift, };

    bless $self, $class;
    return $self;
}

# Create client
sub client {
    my ($self) = @_;
    my $config = $self->{_config};

    # Create bot
    my $bot
        = new Net::XMPP::Client( debuglevel => $config->{debug}->{LEVEL} );

    $bot->SetCallBacks(
        onconnect    => IIBnW::Bot->connectCB(),
        onauth       => IIBnW::Bot->authenCB($bot),
        ondisconnect => IIBnW::Bot->disconnectCB(),
    );

    $bot->SetMessageCallBacks( chat => IIBnW::Bot->messageCB($bot), );

    $bot->execute(
        hostname       => $config->{server}->{HOST},
        port           => $config->{server}->{PORT},
        tls            => $config->{client}->{TLS},
        resource       => $config->{client}->{RESOURCE},
        connectiontype => $config->{client}->{CONNECT},
        username       => $config->{auth}->{USER},
        password       => $config->{auth}->{PASS},
        register       => 0,
    );

    return $bot;
}

sub messageCB {
    my ($class, $client) = @_;
    my $sid      = shift;
    my $msg      = shift;

    # my $from = $msg->GetFrom;
    # my $to   = $msg->GetTo;

    my $name;
    my $data;

    print "From : ", #$from, "\n",
        "Subject : ", $msg->GetSubject, "\n",
        $msg->GetBody, "\n";

    $name = $msg->GetBody;

    $data = $msg->GetBody;

    print ">>$name<<\n";
    print $data, "\n";

    $client->MessageSend(
        # to       => $from,
        # from     => $to,
        resource => 'Gaim',
        type     => $msg->GetType,
        subject  => $msg->GetSubject,
        body     => $data,
    );
}

sub connectCB {
    print "Connected\n";
}

sub authenCB {
    my ($class, $client) = @_;
    print Dumper($client);
    print "Authed\n";
    $client->PresenceSend;
}

sub disconnectCB {
    print "Disconnected\n";
}

1;
