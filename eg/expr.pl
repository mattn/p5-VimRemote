#!perl

use strict;
use warnings;
use VimRemote;

VimRemote::init();
warn VimRemote::serverlist;
#my @s = split /\n/, VimRemote::serverlist;
#my @s = split /\n/, VimRemote::serverlist;
#warn @s;
#if (@s) {
##warn VimRemote::expr($s[0], '1+2');
#}
VimRemote::uninit();
