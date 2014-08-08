#!/usr/bin/perl

use strict;
use warnings;

use Net::XMPP;

use IIBnW::Config;

my $c = IIBnW::Config->new('config.ini');
my $config = $c->load();