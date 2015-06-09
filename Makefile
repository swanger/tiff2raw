# Makefile.in generated by automake 1.12.4 from Makefile.am.
# tools/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1994-2012 Free Software Foundation, Inc.

# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.



# Tag Image File Format (TIFF) Software
#
# Copyright (C) 2004, Andrey Kiselev <dron@ak4719.spb.edu>
#
# Permission to use, copy, modify, distribute, and sell this software and 
# its documentation for any purpose is hereby granted without fee, provided
# that (i) the above copyright notices and this permission notice appear in
# all copies of the software and related documentation, and (ii) the names of
# Sam Leffler and Silicon Graphics may not be used in any advertising or
# publicity relating to the software without the specific, prior written
# permission of Sam Leffler and Silicon Graphics.
# 
# THE SOFTWARE IS PROVIDED "AS-IS" AND WITHOUT WARRANTY OF ANY KIND, 
# EXPRESS, IMPLIED OR OTHERWISE, INCLUDING WITHOUT LIMITATION, ANY 
# WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  
# 
# IN NO EVENT SHALL SAM LEFFLER OR SILICON GRAPHICS BE LIABLE FOR
# ANY SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY KIND,
# OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
# WHETHER OR NOT ADVISED OF THE POSSIBILITY OF DAMAGE, AND ON ANY THEORY OF 
# LIABILITY, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE 
# OF THIS SOFTWARE.

# Process this file with automake to produce Makefile.in.


# am__make_dryrun = \
#   { \
#     am__dry=no; \
#     case $$MAKEFLAGS in \
#       *\\[\ \	]*) \
#         echo 'am--echo: ; @echo "AM"  OK' | $(MAKE) -f - 2>/dev/null \
#           | grep '^AM OK$$' >/dev/null || am__dry=yes;; \
#       *) \
#         for am__flg in $$MAKEFLAGS; do \
#           case $$am__flg in \
#             *=*|--*) ;; \
#             *n*) am__dry=yes; break;; \
#           esac; \
#         done;; \
#     esac; \
#     test $$am__dry = yes; \
#   }
#

pkgdatadir = $(datadir)/tiff
pkgincludedir = $(includedir)/tiff
pkglibdir = $(libdir)/tiff
pkglibexecdir = $(libexecdir)/tiff
am__cd = CDPATH="$${ZSH_VERSION+.}$(PATH_SEPARATOR)" && cd
install_sh_DATA = $(install_sh) -c -m 644
install_sh_PROGRAM = $(install_sh) -c
install_sh_SCRIPT = $(install_sh) -c
INSTALL_HEADER = $(INSTALL_DATA)
transform = $(program_transform_name)
NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
build_triplet = i686-pc-mingw32
host_triplet = i686-pc-mingw32

bin_PROGRAMS = fxsl_img_tool$(EXEEXT)

#am__append_1 = tiffgt
EXTRA_PROGRAMS = sgi2tiff$(EXEEXT) sgisv$(EXEEXT) ycbcr$(EXEEXT)
subdir = tools
DIST_COMMON = $(srcdir)/Makefile.am $(srcdir)/Makefile.in \
	$(top_srcdir)/config/depcomp \
	$(top_srcdir)/config/mkinstalldirs
ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
am__aclocal_m4_deps = $(top_srcdir)/m4/acinclude.m4 \
	$(top_srcdir)/m4/libtool.m4 $(top_srcdir)/m4/ltoptions.m4 \
	$(top_srcdir)/m4/ltsugar.m4 $(top_srcdir)/m4/ltversion.m4 \
	$(top_srcdir)/m4/lt~obsolete.m4 $(top_srcdir)/configure.ac
am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
	$(ACLOCAL_M4)
mkinstalldirs = $(SHELL) $(top_srcdir)/config/mkinstalldirs
CONFIG_HEADER = $(top_builddir)/libtiff/tif_config.h \
	$(top_builddir)/libtiff/tiffconf.h
CONFIG_CLEAN_FILES =
CONFIG_CLEAN_VPATH_FILES =
#am__EXEEXT_1 = tiffgt$(EXEEXT)
am__installdirs = "$(DESTDIR)$(bindir)"
PROGRAMS = $(bin_PROGRAMS)
am_bmp2tiff_OBJECTS = bmp2tiff.$(OBJEXT)
bmp2tiff_OBJECTS = $(am_bmp2tiff_OBJECTS)
bmp2tiff_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
AM_V_lt = $(am__v_lt_$(V))
am__v_lt_ = $(am__v_lt_$(AM_DEFAULT_VERBOSITY))
am__v_lt_0 = --silent
am__v_lt_1 = 
am_fax2ps_OBJECTS = fax2ps.$(OBJEXT)
fax2ps_OBJECTS = $(am_fax2ps_OBJECTS)
fax2ps_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_fax2tiff_OBJECTS = fax2tiff.$(OBJEXT)
fax2tiff_OBJECTS = $(am_fax2tiff_OBJECTS)
fax2tiff_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_gif2tiff_OBJECTS = gif2tiff.$(OBJEXT)
gif2tiff_OBJECTS = $(am_gif2tiff_OBJECTS)
gif2tiff_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_pal2rgb_OBJECTS = pal2rgb.$(OBJEXT)
pal2rgb_OBJECTS = $(am_pal2rgb_OBJECTS)
pal2rgb_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_ppm2tiff_OBJECTS = ppm2tiff.$(OBJEXT)
ppm2tiff_OBJECTS = $(am_ppm2tiff_OBJECTS)
ppm2tiff_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_ras2tiff_OBJECTS = ras2tiff.$(OBJEXT)
ras2tiff_OBJECTS = $(am_ras2tiff_OBJECTS)
ras2tiff_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_raw2tiff_OBJECTS = raw2tiff.$(OBJEXT)
raw2tiff_OBJECTS = $(am_raw2tiff_OBJECTS)
raw2tiff_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_rgb2ycbcr_OBJECTS = rgb2ycbcr.$(OBJEXT)
rgb2ycbcr_OBJECTS = $(am_rgb2ycbcr_OBJECTS)
rgb2ycbcr_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
sgi2tiff_SOURCES = sgi2tiff.c
sgi2tiff_OBJECTS = sgi2tiff.$(OBJEXT)
sgi2tiff_LDADD = $(LDADD)
sgisv_SOURCES = sgisv.c
sgisv_OBJECTS = sgisv.$(OBJEXT)
sgisv_LDADD = $(LDADD)
am_thumbnail_OBJECTS = thumbnail.$(OBJEXT)
thumbnail_OBJECTS = $(am_thumbnail_OBJECTS)
thumbnail_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)

am_tiff2bw_OBJECTS = tiff2bw.$(OBJEXT)
tiff2bw_OBJECTS = $(am_tiff2bw_OBJECTS)
tiff2bw_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)

am_fxsl_img_tool_OBJECTS = fxsl_img_tool.$(OBJEXT)
fxsl_img_tool_OBJECTS = $(am_fxsl_img_tool_OBJECTS)
# fxsl_img_tool_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
fxsl_img_tool_DEPENDENCIES =


am_tiff2pdf_OBJECTS = tiff2pdf.$(OBJEXT)
tiff2pdf_OBJECTS = $(am_tiff2pdf_OBJECTS)
tiff2pdf_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiff2ps_OBJECTS = tiff2ps.$(OBJEXT)
tiff2ps_OBJECTS = $(am_tiff2ps_OBJECTS)
tiff2ps_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiff2rgba_OBJECTS = tiff2rgba.$(OBJEXT)
tiff2rgba_OBJECTS = $(am_tiff2rgba_OBJECTS)
tiff2rgba_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffcmp_OBJECTS = tiffcmp.$(OBJEXT)
tiffcmp_OBJECTS = $(am_tiffcmp_OBJECTS)
tiffcmp_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffcp_OBJECTS = tiffcp.$(OBJEXT)
tiffcp_OBJECTS = $(am_tiffcp_OBJECTS)
tiffcp_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffcrop_OBJECTS = tiffcrop.$(OBJEXT)
tiffcrop_OBJECTS = $(am_tiffcrop_OBJECTS)
tiffcrop_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffdither_OBJECTS = tiffdither.$(OBJEXT)
tiffdither_OBJECTS = $(am_tiffdither_OBJECTS)
tiffdither_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffdump_OBJECTS = tiffdump.$(OBJEXT)
tiffdump_OBJECTS = $(am_tiffdump_OBJECTS)
tiffdump_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffgt_OBJECTS = tiffgt-tiffgt.$(OBJEXT)
tiffgt_OBJECTS = $(am_tiffgt_OBJECTS)
am__DEPENDENCIES_1 =
tiffgt_DEPENDENCIES = $(LIBTIFF) $(LIBPORT) $(am__DEPENDENCIES_1) \
	$(am__DEPENDENCIES_1)
tiffgt_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(tiffgt_CFLAGS) $(CFLAGS) \
	$(AM_LDFLAGS) $(LDFLAGS) -o $@
am_tiffinfo_OBJECTS = tiffinfo.$(OBJEXT)
tiffinfo_OBJECTS = $(am_tiffinfo_OBJECTS)
tiffinfo_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffmedian_OBJECTS = tiffmedian.$(OBJEXT)
tiffmedian_OBJECTS = $(am_tiffmedian_OBJECTS)
tiffmedian_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffset_OBJECTS = tiffset.$(OBJEXT)
tiffset_OBJECTS = $(am_tiffset_OBJECTS)
tiffset_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
am_tiffsplit_OBJECTS = tiffsplit.$(OBJEXT)
tiffsplit_OBJECTS = $(am_tiffsplit_OBJECTS)
tiffsplit_DEPENDENCIES = $(LIBTIFF) $(LIBPORT)
ycbcr_SOURCES = ycbcr.c
ycbcr_OBJECTS = ycbcr.$(OBJEXT)
ycbcr_LDADD = $(LDADD)
AM_V_P = $(am__v_P_$(V))
am__v_P_ = $(am__v_P_$(AM_DEFAULT_VERBOSITY))
am__v_P_0 = false
am__v_P_1 = :
AM_V_GEN = $(am__v_GEN_$(V))
am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
am__v_GEN_0 = @echo "  GEN     " $@;
am__v_GEN_1 = 
AM_V_at = $(am__v_at_$(V))
am__v_at_ = $(am__v_at_$(AM_DEFAULT_VERBOSITY))
am__v_at_0 = @
am__v_at_1 = 
# DEFAULT_INCLUDES = -I. -I$(top_builddir)/libtiff
DEFAULT_INCLUDES = -I.
depcomp = $(SHELL) $(top_srcdir)/config/depcomp
am__depfiles_maybe = depfiles
am__mv = mv -f

# COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
#     $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)

COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)

LTCOMPILE = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=compile $(CC) $(DEFS) \
	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
	$(AM_CFLAGS) $(CFLAGS)

AM_V_CC = $(am__v_CC_$(V))
am__v_CC_ = $(am__v_CC_$(AM_DEFAULT_VERBOSITY))
am__v_CC_0 = @echo "  CC      " $@;
am__v_CC_1 = 
CCLD = $(CC)

# LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
#     $(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
#     $(AM_LDFLAGS) $(LDFLAGS) -o $@

LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@

AM_V_CCLD = $(am__v_CCLD_$(V))
am__v_CCLD_ = $(am__v_CCLD_$(AM_DEFAULT_VERBOSITY))
am__v_CCLD_0 = @echo "  CCLD    " $@;
am__v_CCLD_1 = 
SOURCES = $(bmp2tiff_SOURCES) $(fax2ps_SOURCES) $(fax2tiff_SOURCES) \
	$(gif2tiff_SOURCES) $(pal2rgb_SOURCES) $(ppm2tiff_SOURCES) \
	$(ras2tiff_SOURCES) $(raw2tiff_SOURCES) $(rgb2ycbcr_SOURCES) \
	sgi2tiff.c sgisv.c $(thumbnail_SOURCES) $(tiff2bw_SOURCES) $(fxsl_img_tool_SOURCES)\
	$(tiff2pdf_SOURCES) $(tiff2ps_SOURCES) $(tiff2rgba_SOURCES) \
	$(tiffcmp_SOURCES) $(tiffcp_SOURCES) $(tiffcrop_SOURCES) \
	$(tiffdither_SOURCES) $(tiffdump_SOURCES) $(tiffgt_SOURCES) \
	$(tiffinfo_SOURCES) $(tiffmedian_SOURCES) $(tiffset_SOURCES) \
	$(tiffsplit_SOURCES) ycbcr.c
DIST_SOURCES = $(bmp2tiff_SOURCES) $(fax2ps_SOURCES) \
	$(fax2tiff_SOURCES) $(gif2tiff_SOURCES) $(pal2rgb_SOURCES) \
	$(ppm2tiff_SOURCES) $(ras2tiff_SOURCES) $(raw2tiff_SOURCES) \
	$(rgb2ycbcr_SOURCES) sgi2tiff.c sgisv.c $(thumbnail_SOURCES) \
	$(tiff2bw_SOURCES) $(fxsl_img_tool_SOURCES) $(tiff2pdf_SOURCES) $(tiff2ps_SOURCES) \
	$(tiff2rgba_SOURCES) $(tiffcmp_SOURCES) $(tiffcp_SOURCES) \
	$(tiffcrop_SOURCES) $(tiffdither_SOURCES) $(tiffdump_SOURCES) \
	$(tiffgt_SOURCES) $(tiffinfo_SOURCES) $(tiffmedian_SOURCES) \
	$(tiffset_SOURCES) $(tiffsplit_SOURCES) ycbcr.c
am__can_run_installinfo = \
  case $$AM_UPDATE_INFO_DIR in \
    n|no|NO) false;; \
    *) (install-info --version) >/dev/null 2>&1;; \
  esac
ETAGS = etags
CTAGS = ctags
DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
ACLOCAL = ${SHELL} /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/config/missing --run aclocal-1.12
AMTAR = $${TAR-tar}
AM_DEFAULT_VERBOSITY = 1
AR = ar
AS = as
AUTOCONF = ${SHELL} /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/config/missing --run autoconf
AUTOHEADER = ${SHELL} /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/config/missing --run autoheader
AUTOMAKE = ${SHELL} /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/config/missing --run automake-1.12
AWK = gawk
CC = gcc
CCDEPMODE = depmode=gcc3
CFLAGS = -g -O2 -Wall -W
CPP = gcc -E
CPPFLAGS = 
CXX = g++
CXXCPP = g++ -E
CXXDEPMODE = depmode=gcc3
CXXFLAGS = -g -O2
CYGPATH_W = echo
DEFS = -DHAVE_CONFIG_H
DEPDIR = .deps
DLLTOOL = dlltool
DSYMUTIL = 
DUMPBIN = 
ECHO_C = 
ECHO_N = -n
ECHO_T = 
EGREP = /bin/grep -E
EXEEXT = .exe
FGREP = /bin/grep -F
GLUT_CFLAGS = 
GLUT_LIBS = 
GLU_CFLAGS = 
GLU_LIBS = -lglu32 -lopengl32 -lpthread -lm
GL_CFLAGS = 
GL_LIBS = -lopengl32 -lpthread -lm
GREP = /bin/grep
INSTALL = /bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_STRIP_PROGRAM = $(install_sh) -c -s
LD = c:/mingw/mingw32/bin/ld.exe
LDFLAGS = 
LIBDIR = 
LIBOBJS = 
LIBS = 
LIBTIFF_ALPHA_VERSION = 
LIBTIFF_DOCDIR = ${prefix}/share/doc/tiff-4.0.3
LIBTIFF_MAJOR_VERSION = 4
LIBTIFF_MICRO_VERSION = 3
LIBTIFF_MINOR_VERSION = 0
LIBTIFF_RELEASE_DATE = 20150603
LIBTIFF_VERSION = 4.0.3
LIBTIFF_VERSION_INFO = 7:0:2
# hrw
LIBTOOL = $(SHELL) $(top_builddir)/libtool
  # LIBTOOL =
LIPO = 
LN_S = cp -pR
LTLIBOBJS = 
MAINT = #
MAKEINFO = ${SHELL} /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/config/missing --run makeinfo
MANIFEST_TOOL = :
MKDIR_P = /bin/mkdir -p
NM = /mingw/bin/nm
NMEDIT = 
OBJDUMP = objdump
OBJEXT = o
OTOOL = 
OTOOL64 = 
PACKAGE = tiff
PACKAGE_BUGREPORT = tiff@lists.maptools.org
PACKAGE_NAME = LibTIFF Software
PACKAGE_STRING = LibTIFF Software 4.0.3
PACKAGE_TARNAME = tiff
PACKAGE_URL = 
PACKAGE_VERSION = 4.0.3
PATH_SEPARATOR = :
PTHREAD_CC = gcc
PTHREAD_CFLAGS = 
PTHREAD_LIBS = -lpthread
RANLIB = ranlib
SED = /bin/sed
SET_MAKE = 
SHELL = /bin/sh
STRIP = strip
VERSION = 4.0.3
XMKMF = 
X_CFLAGS = 
X_EXTRA_LIBS = 
X_LIBS = 
X_PRE_LIBS = 
abs_builddir = /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/tools
abs_srcdir = /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/tools
abs_top_builddir = /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3
abs_top_srcdir = /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3
ac_ct_AR = ar
ac_ct_CC = gcc
ac_ct_CXX = g++
ac_ct_DUMPBIN = 
am__include = include
am__leading_dot = .
am__quote = 
am__tar = $${TAR-tar} chof - "$$tardir"
am__untar = $${TAR-tar} xf -
ax_pthread_config = 
bindir = ${exec_prefix}/bin
build = i686-pc-mingw32
build_alias = 
build_cpu = i686
build_os = mingw32
build_vendor = pc
builddir = .
datadir = ${datarootdir}
datarootdir = ${prefix}/share
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
dvidir = ${docdir}
exec_prefix = ${prefix}
host = i686-pc-mingw32
host_alias = 
host_cpu = i686
host_os = mingw32
host_vendor = pc
htmldir = ${docdir}
includedir = ${prefix}/include
infodir = ${datarootdir}/info
install_sh = ${SHELL} /d/ProjectFiles/QC/Programs_Design/tiff-4.0.3/config/install-sh
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
localedir = ${datarootdir}/locale
localstatedir = ${prefix}/var
mandir = ${datarootdir}/man
mkdir_p = $(MKDIR_P)
oldincludedir = /usr/include
pdfdir = ${docdir}
prefix = /usr/local
program_transform_name = s,x,x,
psdir = ${docdir}
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
srcdir = .
sysconfdir = ${prefix}/etc
target_alias = 
tiff_libs_private = 
top_build_prefix = ../
top_builddir = ..
top_srcdir = ..
# LIBPORT = $(top_builddir)/port/libport.la
LIBPORT = 
LIBTIFF = $(top_builddir)/libtiff/libtiff.la
EXTRA_DIST = Makefile.vc
#AM_LDFLAGS = $(LIBDIR)
bmp2tiff_SOURCES = bmp2tiff.c
bmp2tiff_LDADD = $(LIBTIFF) $(LIBPORT)
fax2ps_SOURCES = fax2ps.c
fax2ps_LDADD = $(LIBTIFF) $(LIBPORT)
fax2tiff_SOURCES = fax2tiff.c
fax2tiff_LDADD = $(LIBTIFF) $(LIBPORT)
gif2tiff_SOURCES = gif2tiff.c
gif2tiff_LDADD = $(LIBTIFF) $(LIBPORT)
pal2rgb_SOURCES = pal2rgb.c
pal2rgb_LDADD = $(LIBTIFF) $(LIBPORT)
ppm2tiff_SOURCES = ppm2tiff.c
ppm2tiff_LDADD = $(LIBTIFF) $(LIBPORT)
ras2tiff_SOURCES = ras2tiff.c rasterfile.h
ras2tiff_LDADD = $(LIBTIFF) $(LIBPORT)
raw2tiff_SOURCES = raw2tiff.c
raw2tiff_LDADD = $(LIBTIFF) $(LIBPORT)
rgb2ycbcr_SOURCES = rgb2ycbcr.c
rgb2ycbcr_LDADD = $(LIBTIFF) $(LIBPORT)
thumbnail_SOURCES = thumbnail.c
thumbnail_LDADD = $(LIBTIFF) $(LIBPORT)

tiff2bw_SOURCES = tiff2bw.c
tiff2bw_LDADD = $(LIBTIFF) $(LIBPORT)

fxsl_img_tool_SOURCES = fxsl_img_tool.c
# fxsl_img_tool_LDADD = $(LIBTIFF) $(LIBPORT)
fxsl_img_tool_LDADD = libtiff.a libport.a 

tiff2pdf_SOURCES = tiff2pdf.c
tiff2pdf_LDADD = $(LIBTIFF) $(LIBPORT)
tiff2ps_SOURCES = tiff2ps.c
tiff2ps_LDADD = $(LIBTIFF) $(LIBPORT)
tiff2rgba_SOURCES = tiff2rgba.c
tiff2rgba_LDADD = $(LIBTIFF) $(LIBPORT)
tiffcmp_SOURCES = tiffcmp.c
tiffcmp_LDADD = $(LIBTIFF) $(LIBPORT)
tiffcp_SOURCES = tiffcp.c
tiffcp_LDADD = $(LIBTIFF) $(LIBPORT)
tiffcrop_SOURCES = tiffcrop.c
tiffcrop_LDADD = $(LIBTIFF) $(LIBPORT)
tiffdither_SOURCES = tiffdither.c
tiffdither_LDADD = $(LIBTIFF) $(LIBPORT)
tiffdump_SOURCES = tiffdump.c
tiffdump_LDADD = $(LIBTIFF) $(LIBPORT)
tiffinfo_SOURCES = tiffinfo.c
tiffinfo_LDADD = $(LIBTIFF) $(LIBPORT)
tiffmedian_SOURCES = tiffmedian.c
tiffmedian_LDADD = $(LIBTIFF) $(LIBPORT)
tiffset_SOURCES = tiffset.c
tiffset_LDADD = $(LIBTIFF) $(LIBPORT)
tiffsplit_SOURCES = tiffsplit.c
tiffsplit_LDADD = $(LIBTIFF) $(LIBPORT)
tiffgt_SOURCES = tiffgt.c
tiffgt_CFLAGS = $(CFLAGS) $(GLUT_CFLAGS) $(AM_CFLAGS)
tiffgt_LDADD = $(LIBTIFF) $(LIBPORT) $(X_LIBS) $(GLUT_LIBS)
# AM_CPPFLAGS = -I$(top_srcdir)/libtiff
AM_CPPFLAGS = 
all: all-am

# .SUFFIXES:
# .SUFFIXES: .c .lo .o .obj
# $(srcdir)/Makefile.in: # $(srcdir)/Makefile.am  $(am__configure_deps)
#     @for dep in $?; do \
#       case '$(am__configure_deps)' in \
#         *$$dep*) \
#           ( cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh ) \
#             && { if test -f $@; then exit 0; else break; fi; }; \
#           exit 1;; \
#       esac; \
#     done; \
#     echo ' cd $(top_srcdir) && $(AUTOMAKE) --foreign tools/Makefile'; \
#     $(am__cd) $(top_srcdir) && \
#       $(AUTOMAKE) --foreign tools/Makefile
# .PRECIOUS: Makefile
# Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
#     @case '$?' in \
#       *config.status*) \
#         cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh;; \
#       *) \
#         echo ' cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe)'; \
#         cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe);; \
#     esac;

# $(top_builddir)/config.status: $(top_srcdir)/configure $(CONFIG_STATUS_DEPENDENCIES)
#     cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh

# $(top_srcdir)/configure: # $(am__configure_deps)
#     cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
# $(ACLOCAL_M4): # $(am__aclocal_m4_deps)
#     cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
# $(am__aclocal_m4_deps):
# install-binPROGRAMS: $(bin_PROGRAMS)
#     @$(NORMAL_INSTALL)
#     @list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
#     if test -n "$$list"; then \
#       echo " $(MKDIR_P) '$(DESTDIR)$(bindir)'"; \
#       $(MKDIR_P) "$(DESTDIR)$(bindir)" || exit 1; \
#     fi; \
#     for p in $$list; do echo "$$p $$p"; done | \
#     sed 's/$(EXEEXT)$$//' | \
#     while read p p1; do if test -f $$p || test -f $$p1; \
#       then echo "$$p"; echo "$$p"; else :; fi; \
#     done | \
#     sed -e 'p;s,.*/,,;n;h' -e 's|.*|.|' \
#         -e 'p;x;s,.*/,,;s/$(EXEEXT)$$//;$(transform);s/$$/$(EXEEXT)/' | \
#     sed 'N;N;N;s,\n, ,g' | \
#     $(AWK) 'BEGIN { files["."] = ""; dirs["."] = 1 } \
#       { d=$$3; if (dirs[d] != 1) { print "d", d; dirs[d] = 1 } \
#         if ($$2 == $$4) files[d] = files[d] " " $$1; \
#         else { print "f", $$3 "/" $$4, $$1; } } \
#       END { for (d in files) print "f", d, files[d] }' | \
#     while read type dir files; do \
#         if test "$$dir" = .; then dir=; else dir=/$$dir; fi; \
#         test -z "$$files" || { \
#         echo " $(INSTALL_PROGRAM_ENV) $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=install $(INSTALL_PROGRAM) $$files '$(DESTDIR)$(bindir)$$dir'"; \
#         $(INSTALL_PROGRAM_ENV) $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=install $(INSTALL_PROGRAM) $$files "$(DESTDIR)$(bindir)$$dir" || exit $$?; \
#         } \
#     ; done

uninstall-binPROGRAMS:
	@$(NORMAL_UNINSTALL)
	@list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
	files=`for p in $$list; do echo "$$p"; done | \
	  sed -e 'h;s,^.*/,,;s/$(EXEEXT)$$//;$(transform)' \
		  -e 's/$$/$(EXEEXT)/' `; \
	test -n "$$list" || exit 0; \
	echo " ( cd '$(DESTDIR)$(bindir)' && rm -f" $$files ")"; \
	cd "$(DESTDIR)$(bindir)" && rm -f $$files

clean-binPROGRAMS:
	@list='$(bin_PROGRAMS)'; test -n "$$list" || exit 0; \
	echo " rm -f" $$list; \
	rm -f $$list || exit $$?; \
	test -n "$(EXEEXT)" || exit 0; \
	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
	echo " rm -f" $$list; \
	rm -f $$list
# bmp2tiff$(EXEEXT): $(bmp2tiff_OBJECTS) $(bmp2tiff_DEPENDENCIES) $(EXTRA_bmp2tiff_DEPENDENCIES) 
#     @rm -f bmp2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(bmp2tiff_OBJECTS) $(bmp2tiff_LDADD) $(LIBS)
# fax2ps$(EXEEXT): $(fax2ps_OBJECTS) $(fax2ps_DEPENDENCIES) $(EXTRA_fax2ps_DEPENDENCIES) 
#     @rm -f fax2ps$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(fax2ps_OBJECTS) $(fax2ps_LDADD) $(LIBS)
# fax2tiff$(EXEEXT): $(fax2tiff_OBJECTS) $(fax2tiff_DEPENDENCIES) $(EXTRA_fax2tiff_DEPENDENCIES) 
#     @rm -f fax2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(fax2tiff_OBJECTS) $(fax2tiff_LDADD) $(LIBS)
# gif2tiff$(EXEEXT): $(gif2tiff_OBJECTS) $(gif2tiff_DEPENDENCIES) $(EXTRA_gif2tiff_DEPENDENCIES) 
#     @rm -f gif2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(gif2tiff_OBJECTS) $(gif2tiff_LDADD) $(LIBS)
# pal2rgb$(EXEEXT): $(pal2rgb_OBJECTS) $(pal2rgb_DEPENDENCIES) $(EXTRA_pal2rgb_DEPENDENCIES) 
#     @rm -f pal2rgb$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(pal2rgb_OBJECTS) $(pal2rgb_LDADD) $(LIBS)
# ppm2tiff$(EXEEXT): $(ppm2tiff_OBJECTS) $(ppm2tiff_DEPENDENCIES) $(EXTRA_ppm2tiff_DEPENDENCIES) 
#     @rm -f ppm2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(ppm2tiff_OBJECTS) $(ppm2tiff_LDADD) $(LIBS)
# ras2tiff$(EXEEXT): $(ras2tiff_OBJECTS) $(ras2tiff_DEPENDENCIES) $(EXTRA_ras2tiff_DEPENDENCIES) 
#     @rm -f ras2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(ras2tiff_OBJECTS) $(ras2tiff_LDADD) $(LIBS)
# raw2tiff$(EXEEXT): $(raw2tiff_OBJECTS) $(raw2tiff_DEPENDENCIES) $(EXTRA_raw2tiff_DEPENDENCIES) 
#     @rm -f raw2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(raw2tiff_OBJECTS) $(raw2tiff_LDADD) $(LIBS)
# rgb2ycbcr$(EXEEXT): $(rgb2ycbcr_OBJECTS) $(rgb2ycbcr_DEPENDENCIES) $(EXTRA_rgb2ycbcr_DEPENDENCIES) 
#     @rm -f rgb2ycbcr$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(rgb2ycbcr_OBJECTS) $(rgb2ycbcr_LDADD) $(LIBS)
# sgi2tiff$(EXEEXT): $(sgi2tiff_OBJECTS) $(sgi2tiff_DEPENDENCIES) $(EXTRA_sgi2tiff_DEPENDENCIES) 
#     @rm -f sgi2tiff$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(sgi2tiff_OBJECTS) $(sgi2tiff_LDADD) $(LIBS)
# sgisv$(EXEEXT): $(sgisv_OBJECTS) $(sgisv_DEPENDENCIES) $(EXTRA_sgisv_DEPENDENCIES) 
#     @rm -f sgisv$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(sgisv_OBJECTS) $(sgisv_LDADD) $(LIBS)
# thumbnail$(EXEEXT): $(thumbnail_OBJECTS) $(thumbnail_DEPENDENCIES) $(EXTRA_thumbnail_DEPENDENCIES) 
#     @rm -f thumbnail$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(thumbnail_OBJECTS) $(thumbnail_LDADD) $(LIBS)
# tiff2bw$(EXEEXT): $(tiff2bw_OBJECTS) $(tiff2bw_DEPENDENCIES) $(EXTRA_tiff2bw_DEPENDENCIES) 
#     @rm -f tiff2bw$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiff2bw_OBJECTS) $(tiff2bw_LDADD) $(LIBS)

fxsl_img_tool$(EXEEXT): $(fxsl_img_tool_OBJECTS) $(fxsl_img_tool_DEPENDENCIES) $(EXTRA_fxsl_img_tool_DEPENDENCIES) 
	@rm -f fxsl_img_tool$(EXEEXT)
	$(LINK) $(fxsl_img_tool_OBJECTS) $(fxsl_img_tool_LDADD)

# tiff2pdf$(EXEEXT): $(tiff2pdf_OBJECTS) $(tiff2pdf_DEPENDENCIES) $(EXTRA_tiff2pdf_DEPENDENCIES) 
#     @rm -f tiff2pdf$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiff2pdf_OBJECTS) $(tiff2pdf_LDADD) $(LIBS)
# tiff2ps$(EXEEXT): $(tiff2ps_OBJECTS) $(tiff2ps_DEPENDENCIES) $(EXTRA_tiff2ps_DEPENDENCIES) 
#     @rm -f tiff2ps$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiff2ps_OBJECTS) $(tiff2ps_LDADD) $(LIBS)
# tiff2rgba$(EXEEXT): $(tiff2rgba_OBJECTS) $(tiff2rgba_DEPENDENCIES) $(EXTRA_tiff2rgba_DEPENDENCIES) 
#     @rm -f tiff2rgba$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiff2rgba_OBJECTS) $(tiff2rgba_LDADD) $(LIBS)
# tiffcmp$(EXEEXT): $(tiffcmp_OBJECTS) $(tiffcmp_DEPENDENCIES) $(EXTRA_tiffcmp_DEPENDENCIES) 
#     @rm -f tiffcmp$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffcmp_OBJECTS) $(tiffcmp_LDADD) $(LIBS)
# tiffcp$(EXEEXT): $(tiffcp_OBJECTS) $(tiffcp_DEPENDENCIES) $(EXTRA_tiffcp_DEPENDENCIES) 
#     @rm -f tiffcp$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffcp_OBJECTS) $(tiffcp_LDADD) $(LIBS)
# tiffcrop$(EXEEXT): $(tiffcrop_OBJECTS) $(tiffcrop_DEPENDENCIES) $(EXTRA_tiffcrop_DEPENDENCIES) 
#     @rm -f tiffcrop$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffcrop_OBJECTS) $(tiffcrop_LDADD) $(LIBS)
# tiffdither$(EXEEXT): $(tiffdither_OBJECTS) $(tiffdither_DEPENDENCIES) $(EXTRA_tiffdither_DEPENDENCIES) 
#     @rm -f tiffdither$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffdither_OBJECTS) $(tiffdither_LDADD) $(LIBS)
# tiffdump$(EXEEXT): $(tiffdump_OBJECTS) $(tiffdump_DEPENDENCIES) $(EXTRA_tiffdump_DEPENDENCIES) 
#     @rm -f tiffdump$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffdump_OBJECTS) $(tiffdump_LDADD) $(LIBS)
# tiffgt$(EXEEXT): $(tiffgt_OBJECTS) $(tiffgt_DEPENDENCIES) $(EXTRA_tiffgt_DEPENDENCIES) 
#     @rm -f tiffgt$(EXEEXT)
#     $(AM_V_CCLD)$(tiffgt_LINK) $(tiffgt_OBJECTS) $(tiffgt_LDADD) $(LIBS)
# tiffinfo$(EXEEXT): $(tiffinfo_OBJECTS) $(tiffinfo_DEPENDENCIES) $(EXTRA_tiffinfo_DEPENDENCIES) 
#     @rm -f tiffinfo$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffinfo_OBJECTS) $(tiffinfo_LDADD) $(LIBS)
# tiffmedian$(EXEEXT): $(tiffmedian_OBJECTS) $(tiffmedian_DEPENDENCIES) $(EXTRA_tiffmedian_DEPENDENCIES) 
#     @rm -f tiffmedian$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffmedian_OBJECTS) $(tiffmedian_LDADD) $(LIBS)
# tiffset$(EXEEXT): $(tiffset_OBJECTS) $(tiffset_DEPENDENCIES) $(EXTRA_tiffset_DEPENDENCIES) 
#     @rm -f tiffset$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffset_OBJECTS) $(tiffset_LDADD) $(LIBS)
# tiffsplit$(EXEEXT): $(tiffsplit_OBJECTS) $(tiffsplit_DEPENDENCIES) $(EXTRA_tiffsplit_DEPENDENCIES) 
#     @rm -f tiffsplit$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(tiffsplit_OBJECTS) $(tiffsplit_LDADD) $(LIBS)
# ycbcr$(EXEEXT): $(ycbcr_OBJECTS) $(ycbcr_DEPENDENCIES) $(EXTRA_ycbcr_DEPENDENCIES) 
#     @rm -f ycbcr$(EXEEXT)
#     $(AM_V_CCLD)$(LINK) $(ycbcr_OBJECTS) $(ycbcr_LDADD) $(LIBS)

mostlyclean-compile:
	-rm -f *.$(OBJEXT)
	-rm -f *.d
	-rm -f *.raw



# include ./$(DEPDIR)/bmp2tiff.Po
# include ./$(DEPDIR)/fax2ps.Po
# include ./$(DEPDIR)/fax2tiff.Po
# include ./$(DEPDIR)/gif2tiff.Po
# include ./$(DEPDIR)/pal2rgb.Po
# include ./$(DEPDIR)/ppm2tiff.Po
# include ./$(DEPDIR)/ras2tiff.Po
# include ./$(DEPDIR)/raw2tiff.Po
# include ./$(DEPDIR)/rgb2ycbcr.Po
# include ./$(DEPDIR)/sgi2tiff.Po
# include ./$(DEPDIR)/sgisv.Po
# include ./$(DEPDIR)/thumbnail.Po
# include ./$(DEPDIR)/tiff2bw.Po
# include ./$(DEPDIR)/tiff2pdf.Po
# include ./$(DEPDIR)/tiff2ps.Po
# include ./$(DEPDIR)/tiff2rgba.Po
# include ./$(DEPDIR)/tiffcmp.Po
# include ./$(DEPDIR)/tiffcp.Po
# include ./$(DEPDIR)/tiffcrop.Po
# include ./$(DEPDIR)/tiffdither.Po
# include ./$(DEPDIR)/tiffdump.Po
# include ./$(DEPDIR)/tiffgt-tiffgt.Po
# include ./$(DEPDIR)/tiffinfo.Po
# include ./$(DEPDIR)/tiffmedian.Po
# include ./$(DEPDIR)/tiffset.Po
# include ./$(DEPDIR)/tiffsplit.Po
# include ./$(DEPDIR)/ycbcr.Po

.c.o:
	$(AM_V_CC)$(COMPILE) -MT $@ -MD -MP -c -o $@ $<

# .c.o:
#     $(AM_V_CC)$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
#     $(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
# #	$(AM_V_CC)source='$<' object='$@' libtool=no \
# #	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
# #	$(AM_V_CC_no)$(COMPILE) -c $<

# .c.obj:
#     $(AM_V_CC)$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ `$(CYGPATH_W) '$<'`
#     $(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
# #	$(AM_V_CC)source='$<' object='$@' libtool=no \
# #	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
# #	$(AM_V_CC_no)$(COMPILE) -c `$(CYGPATH_W) '$<'`

# .c.lo:
#     $(AM_V_CC)$(LTCOMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
#     $(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Plo
# #	$(AM_V_CC)source='$<' object='$@' libtool=yes \
# #	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
# #	$(AM_V_CC_no)$(LTCOMPILE) -c -o $@ $<

# tiffgt-tiffgt.o: tiffgt.c
#     $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(tiffgt_CFLAGS) $(CFLAGS) -MT tiffgt-tiffgt.o -MD -MP -MF $(DEPDIR)/tiffgt-tiffgt.Tpo -c -o tiffgt-tiffgt.o `test -f 'tiffgt.c' || echo '$(srcdir)/'`tiffgt.c
#     $(AM_V_at)$(am__mv) $(DEPDIR)/tiffgt-tiffgt.Tpo $(DEPDIR)/tiffgt-tiffgt.Po
# #	$(AM_V_CC)source='tiffgt.c' object='tiffgt-tiffgt.o' libtool=no \
# #	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
# #	$(AM_V_CC_no)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(tiffgt_CFLAGS) $(CFLAGS) -c -o tiffgt-tiffgt.o `test -f 'tiffgt.c' || echo '$(srcdir)/'`tiffgt.c

# tiffgt-tiffgt.obj: tiffgt.c
#     $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(tiffgt_CFLAGS) $(CFLAGS) -MT tiffgt-tiffgt.obj -MD -MP -MF $(DEPDIR)/tiffgt-tiffgt.Tpo -c -o tiffgt-tiffgt.obj `if test -f 'tiffgt.c'; then $(CYGPATH_W) 'tiffgt.c'; else $(CYGPATH_W) '$(srcdir)/tiffgt.c'; fi`
#     $(AM_V_at)$(am__mv) $(DEPDIR)/tiffgt-tiffgt.Tpo $(DEPDIR)/tiffgt-tiffgt.Po
# #	$(AM_V_CC)source='tiffgt.c' object='tiffgt-tiffgt.obj' libtool=no \
# #	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) \
# #	$(AM_V_CC_no)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(tiffgt_CFLAGS) $(CFLAGS) -c -o tiffgt-tiffgt.obj `if test -f 'tiffgt.c'; then $(CYGPATH_W) 'tiffgt.c'; else $(CYGPATH_W) '$(srcdir)/tiffgt.c'; fi`


ID: $(HEADERS) $(SOURCES) $(LISP) $(TAGS_FILES)
	list='$(SOURCES) $(HEADERS) $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '{ files[$$0] = 1; nonempty = 1; } \
	      END { if (nonempty) { for (i in files) print i; }; }'`; \
	mkid -fID $$unique
tags: TAGS

TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
		$(TAGS_FILES) $(LISP)
	set x; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)  $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '{ files[$$0] = 1; nonempty = 1; } \
	      END { if (nonempty) { for (i in files) print i; }; }'`; \
	shift; \
	if test -z "$(ETAGS_ARGS)$$*$$unique"; then :; else \
	  test -n "$$unique" || unique=$$empty_fix; \
	  if test $$# -gt 0; then \
	    $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	      "$$@" $$unique; \
	  else \
	    $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	      $$unique; \
	  fi; \
	fi
ctags: CTAGS
CTAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
		$(TAGS_FILES) $(LISP)
	list='$(SOURCES) $(HEADERS)  $(LISP) $(TAGS_FILES)'; \
	unique=`for i in $$list; do \
	    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
	  done | \
	  $(AWK) '{ files[$$0] = 1; nonempty = 1; } \
	      END { if (nonempty) { for (i in files) print i; }; }'`; \
	test -z "$(CTAGS_ARGS)$$unique" \
	  || $(CTAGS) $(CTAGSFLAGS) $(AM_CTAGSFLAGS) $(CTAGS_ARGS) \
	     $$unique

GTAGS:
	here=`$(am__cd) $(top_builddir) && pwd` \
	  && $(am__cd) $(top_srcdir) \
	  && gtags -i $(GTAGS_ARGS) "$$here"

cscopelist:  $(HEADERS) $(SOURCES) $(LISP)
	list='$(SOURCES) $(HEADERS) $(LISP)'; \
	case "$(srcdir)" in \
	  [\\/]* | ?:[\\/]*) sdir="$(srcdir)" ;; \
	  *) sdir=$(subdir)/$(srcdir) ;; \
	esac; \
	for i in $$list; do \
	  if test -f "$$i"; then \
	    echo "$(subdir)/$$i"; \
	  else \
	    echo "$$sdir/$$i"; \
	  fi; \
	done >> $(top_builddir)/cscope.files


distdir: $(DISTFILES)
	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
	list='$(DISTFILES)'; \
	  dist_files=`for file in $$list; do echo $$file; done | \
	  sed -e "s|^$$srcdirstrip/||;t" \
	      -e "s|^$$topsrcdirstrip/|$(top_builddir)/|;t"`; \
	case $$dist_files in \
	  */*) $(MKDIR_P) `echo "$$dist_files" | \
			   sed '/\//!d;s|^|$(distdir)/|;s,/[^/]*$$,,' | \
			   sort -u` ;; \
	esac; \
	for file in $$dist_files; do \
	  if test -f $$file || test -d $$file; then d=.; else d=$(srcdir); fi; \
	  if test -d $$d/$$file; then \
	    dir=`echo "/$$file" | sed -e 's,/[^/]*$$,,'`; \
	    if test -d "$(distdir)/$$file"; then \
	      find "$(distdir)/$$file" -type d ! -perm -700 -exec chmod u+rwx {} \;; \
	    fi; \
	    if test -d $(srcdir)/$$file && test $$d != $(srcdir); then \
	      cp -fpR $(srcdir)/$$file "$(distdir)$$dir" || exit 1; \
	      find "$(distdir)/$$file" -type d ! -perm -700 -exec chmod u+rwx {} \;; \
	    fi; \
	    cp -fpR $$d/$$file "$(distdir)$$dir" || exit 1; \
	  else \
	    test -f "$(distdir)/$$file" \
	    || cp -p $$d/$$file "$(distdir)/$$file" \
	    || exit 1; \
	  fi; \
	done
check-am: all-am
check: check-am
all-am: Makefile $(PROGRAMS)
installdirs:
	for dir in "$(DESTDIR)$(bindir)"; do \
	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
	done
install: install-am
install-exec: install-exec-am
install-data: install-data-am
uninstall: uninstall-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am

installcheck: installcheck-am
install-strip:
	if test -z '$(STRIP)'; then \
	  $(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	    install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	      install; \
	else \
	  $(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	    install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	    "INSTALL_PROGRAM_ENV=STRIPPROG='$(STRIP)'" install; \
	fi
mostlyclean-generic:

clean-generic:


maintainer-clean-generic:
	@echo "This command is intended for maintainers to use"
	@echo "it deletes files that may require special tools to rebuild."
clean: clean-am

clean-am: clean-binPROGRAMS clean-generic mostlyclean-am

dvi: dvi-am

dvi-am:

html: html-am

html-am:

info: info-am

info-am:

install-data-am:

install-dvi: install-dvi-am

install-dvi-am:

install-exec-am: install-binPROGRAMS

install-html: install-html-am

install-html-am:

install-info: install-info-am

install-info-am:

install-man:

install-pdf: install-pdf-am

install-pdf-am:

install-ps: install-ps-am

install-ps-am:

installcheck-am:

maintainer-clean: maintainer-clean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
maintainer-clean-am: maintainer-clean-generic

mostlyclean: mostlyclean-am

mostlyclean-am: mostlyclean-compile mostlyclean-generic \
	mostlyclean-libtool

pdf: pdf-am

pdf-am:

ps: ps-am

ps-am:

uninstall-am: uninstall-binPROGRAMS

.MAKE: install-am install-strip

.PHONY: CTAGS GTAGS all all-am check check-am clean clean-binPROGRAMS \
	clean-generic clean-libtool cscopelist ctags \
	distdir dvi dvi-am html html-am info info-am \
	install install-am install-binPROGRAMS install-data \
	install-data-am install-dvi install-dvi-am install-exec \
	install-exec-am install-html install-html-am install-info \
	install-info-am install-man install-pdf install-pdf-am \
	install-ps install-ps-am install-strip installcheck \
	installcheck-am installdirs maintainer-clean \
	maintainer-clean-generic mostlyclean mostlyclean-compile \
	mostlyclean-generic mostlyclean-libtool pdf pdf-am ps ps-am \
	tags uninstall uninstall-am uninstall-binPROGRAMS


echo:
	(echo $(CFLAGS))
	(echo $(tiffgt_CFLAGS))
	(echo $(GL_CFLAGS))
	(echo $(GLU_CFLAGS))
	(echo $(GLUT_CFLAGS))

# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT: