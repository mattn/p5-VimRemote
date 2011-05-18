use inc::Module::Install;
name 'VimRemote';
all_from 'lib/VimRemote.pm';

tests 't/*.t t/*/*.t';
author_tests 'xt';

build_requires 'Test::More';
build_requires 'YAML';

can_cc or die "This module requires a C compiler";

makemaker_args(
	OBJECT => '$(O_FILES) vim-remote/src/vimthings.o '
		. ($^O eq 'MSWin32' ? 'vim-remote/src/vimremote_win32.o'
			: 'vim-remote/src/vimremote_unix.o'),
	clean => {
		FILES => q{
			*.stackdump
			*.gcov *.gcda *.gcno
			*.out
			nytprof
			cover_db
		},
	},
	INC => '-Ivim-remote/src',
);

use_test_base;
auto_include;
WriteAll();

sub MY::postamble {
	return <<'EOF';
vim-remote/src/%.o: vim-remote/src/%.c
	$(CC) $(CCFLAGS) -c -o $@ $<
EOF
}
