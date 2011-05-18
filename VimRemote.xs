#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include "vimremote.h"


MODULE = VimRemote PACKAGE = VimRemote

PROTOTYPES: DISABLED

void
init()
    CODE:
		dXSARGS;
		if (vimremote_init()) {
			Perl_croak(aTHX_ "vimremote_init() failed");
		}

void
uninit()
    CODE:
		dXSARGS;
		if (vimremote_uninit()) {
			Perl_croak(aTHX_ "vimremote_uninit() failed");
		}

SV*
expr(const char* servername, const char* expr)
    CODE:
		dXSARGS;
        char* ret = NULL;
		if (vimremote_remoteexpr(servername, expr, &ret)) {
			Perl_croak(aTHX_ ret);
		} else {
			RETVAL = newSVpv(ret, strlen(ret));
			vimremote_free(ret);
		}
    OUTPUT:
        RETVAL

SV*
serverlist()
    CODE:
		dXSARGS;
        char* ret = NULL;
		if (vimremote_serverlist(&ret)) {
			Perl_croak(aTHX_ ret);
		} else {
			RETVAL = newSVpv(ret, strlen(ret));
			vimremote_free(ret);
		}
    OUTPUT:
        RETVAL

