#!/usr/bin/perl

use IIBnW::Config;
use IIBnW::Bot;

# Load config
my $c = IIBnW::Config->new('config.ini');
my $config = $c->load();

# The bot object
my $bot = IIBnW::Bot->new($config);

# Create client
$bot->client();

