#
# config.mk.in -- autoconf template for Vim on Unix		vim:ts=8:sw=8:
#
# DO NOT EDIT config.mk!!  It will be overwritten by configure.
# Edit Makefile and run "make" or run ./configure with other arguments.
#
# Configure does not edit the makefile directly. This method is not the
# standard use of GNU autoconf, but it has two advantages:
#   a) The user can override every choice made by configure.
#   b) Modifications to the makefile are not lost when configure is run.
#
# I hope this is worth being nonstandard. jw.



VIMNAME		= vim
EXNAME		= ex
VIEWNAME	= view

CC		= gcc
DEFS		= -DHAVE_CONFIG_H
CFLAGS		= -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
CPPFLAGS	=  -DMACOS_X_UNIX -no-cpp-precomp
srcdir		= .

LDFLAGS		= -L.     -L/usr/local/lib
LIBS		= -lm -lncurses  -liconv -framework Cocoa
TAGPRG		= ctags -t

CPP		= gcc -E
CPP_MM		= M
DEPEND_CFLAGS_FILTER = | sed 's+-I */+-isystem /+g'
LINK_AS_NEEDED	= 
X_CFLAGS	= 
X_LIBS_DIR	= 
X_PRE_LIBS	= 
X_EXTRA_LIBS	= 
X_LIBS		= 

LUA_LIBS	= 
LUA_SRC		= 
LUA_OBJ		= 
LUA_CFLAGS	= 
LUA_PRO		= 

MZSCHEME_LIBS	= 
MZSCHEME_SRC	= 
MZSCHEME_OBJ	= 
MZSCHEME_CFLAGS	= 
MZSCHEME_PRO	= 
MZSCHEME_EXTRA  = 
MZSCHEME_MZC	= 

PERL		= 
PERLLIB		= 
PERL_LIBS	= 
SHRPENV		= 
PERL_SRC	= 
PERL_OBJ	= 
PERL_PRO	= 
PERL_CFLAGS	= 

PYTHON_SRC	= if_python.c
PYTHON_OBJ	= objects/if_python.o
PYTHON_CFLAGS	= -I/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7 -DPYTHON_HOME=\"/Library/Frameworks/Python.framework/Versions/2.7\"
PYTHON_LIBS	= -framework Python
PYTHON_CONFDIR	= /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config
PYTHON_GETPATH_CFLAGS = -DPYTHONPATH='":/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/setuptools-0.6c11-py2.7.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/xdot-0.4-py2.7.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/Twisted-12.3.0-py2.7-macosx-10.6-intel.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/zope.interface-4.0.5-py2.7-macosx-10.6-intel.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/pip-1.3.1-py2.7.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/psphere-0.5.3-py2.7.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/PyYAML-3.10-py2.7-macosx-10.6-intel.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/suds-0.4-py2.7.egg:/Library/Frameworks/Python.framework/Versions/2.7/lib/python27.zip:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-darwin:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac/lib-scriptpackages:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-old:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/setuptools-0.6c11-py2.7.egg-info:/Library/Python/2.7/site-packages"' -DPREFIX='"/Library/Frameworks/Python.framework/Versions/2.7"' -DEXEC_PREFIX='"/Library/Frameworks/Python.framework/Versions/2.7"'

PYTHON3_SRC	= 
PYTHON3_OBJ	= 
PYTHON3_CFLAGS	= 
PYTHON3_LIBS	= 
PYTHON3_CONFDIR	= 

TCL		= 
TCL_SRC		= 
TCL_OBJ		= 
TCL_PRO		= 
TCL_CFLAGS	= 
TCL_LIBS	= 

HANGULIN_SRC	= 
HANGULIN_OBJ	= 

WORKSHOP_SRC	= 
WORKSHOP_OBJ	= 

NETBEANS_SRC	= netbeans.c
NETBEANS_OBJ	= objects/netbeans.o

RUBY		= /usr/bin/ruby
RUBY_SRC	= if_ruby.c
RUBY_OBJ	= objects/if_ruby.o
RUBY_PRO	= if_ruby.pro
RUBY_CFLAGS	= -I/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/universal-darwin11.0 -DRUBY_VERSION=18
RUBY_LIBS	= -lruby -lpthread -ldl -lobjc 

SNIFF_SRC	= 
SNIFF_OBJ	= 

AWK		= awk

STRIP		= strip

EXEEXT		= 

COMPILEDBY	= 

INSTALLVIMDIFF	= installvimdiff
INSTALLGVIMDIFF	= installgvimdiff
INSTALL_LANGS	= install-languages
INSTALL_TOOL_LANGS	= install-tool-languages

### sed command to fix quotes while creating pathdef.c
QUOTESED        = sed -e 's/[\\"]/\\&/g' -e 's/\\"/"/' -e 's/\\";$$/";/'

### Line break character as octal number for "tr"
NL		= "\\012"

### Top directory for everything
prefix		= /Users/tim/opt/vim

### Top directory for the binary
exec_prefix	= ${prefix}

### Prefix for location of data files
BINDIR		= ${exec_prefix}/bin

### For autoconf 2.60 and later (avoid a warning)
datarootdir	= ${prefix}/share

### Prefix for location of data files
DATADIR		= ${datarootdir}

### Prefix for location of man pages
MANDIR		= ${datarootdir}/man

### Do we have a GUI
GUI_INC_LOC	= 
GUI_LIB_LOC	= 
GUI_SRC		= $(NONE_SRC)
GUI_OBJ		= $(NONE_OBJ)
GUI_DEFS	= $(NONE_DEFS)
GUI_IPATH	= $(NONE_IPATH)
GUI_LIBS_DIR	= $(NONE_LIBS_DIR)
GUI_LIBS1	= $(NONE_LIBS1)
GUI_LIBS2	= $(NONE_LIBS2)
GUI_INSTALL	= $(NONE_INSTALL)
GUI_TARGETS	= $(NONE_TARGETS)
GUI_MAN_TARGETS	= $(NONE_MAN_TARGETS)
GUI_TESTTARGET	= $(NONE_TESTTARGET)
GUI_TESTARG	= $(NONE_TESTARG)
GUI_BUNDLE	= $(NONE_BUNDLE)
NARROW_PROTO	= 
GUI_X_LIBS	= 
MOTIF_LIBNAME	= 
GTK_LIBNAME	= 

### Any OS dependent extra source and object file
OS_EXTRA_SRC	= os_macosx.m os_mac_conv.c
OS_EXTRA_OBJ	= objects/os_macosx.o objects/os_mac_conv.o

### If the *.po files are to be translated to *.mo files.
MAKEMO		= 

# Make sure that "make first" will run "make all" once configure has done its
# work.  This is needed when using the Makefile in the top directory.
first: all
