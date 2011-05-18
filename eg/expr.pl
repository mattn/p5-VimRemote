#!perl

use strict;
use warnings;
use VimRemote;

VimRemote::init();
warn VimRemote::expr(shift, '1+2');
VimRemote::uninit();
