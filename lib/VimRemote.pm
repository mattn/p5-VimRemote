package VimRemote;
use 5.008;
use strict;
use warnings;
our $VERSION = '0.01';

require XSLoader;
XSLoader::load('VimRemote', $VERSION);

1;
