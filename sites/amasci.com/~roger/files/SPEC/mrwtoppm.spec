%define name mrwtoppm
%define version 0.0.a9
%define release 1mdk

Summary: 	This is mrwtoppm, a command line utility for converting raw image files from Minolta DiMAGE 5, 7, and 7i cameras into ppm files.
Name: 		%{name}
Version: 	%{version}
Release: 	%{release}
Source: 	%{name}-%{version}.tar.bz2
License: 	GPL
Group: 		Graphics
Summary: 	A command line utility for converting raw image files from Minolta DiMAGE 5, 7, and 7i cameras into ppm files.
URL: 		http://home.swbell.net/dobroom/mintoppm/
Requires: 	netpbm, liblcms1
Provides: 	%{name}-%{version}-%{release}
BuildRoot:	%{_tmppath}/%{name}-%{version}
BuildRequires: 	liblcms1-devel
Distribution: 	Mandrake
Vendor: 	Mandrakesoft
Packager: 	Roger <roger@eskimo.com>

%description
This is mrwtoppm, a command line utility for converting raw image files
from Minolta DiMAGE 5, 7, and 7i cameras into ppm files.  This also
includes a Gimp Plugin for opening mrw (raw) image files.

%prep
rm -rf ${RPM_BUILD_ROOT}
%setup -q

%build
%configure --prefix=/usr --with-lcms=/usr --with-lcms-libraries=/usr/lib --with-lcms-includes=/usr/include/lcms --with-lcms-profiles=/usr/share/lcms-1.09
%make

%install
%makeinstall
mkdir -p ${RPM_BUILD_ROOT}/usr/lib/gimp/1.2/plug-ins

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root)
%doc AUTHORS ChangeLog COPYING INSTALL NEWS README TODO ./colormaps/*.cmap ./profiles/*.icc ./tonecurves/*.tc
%{_bindir}/*
%{_mandir}/man*/*
%{_prefix}/lib/gimp/1.2/plug-ins/mrw

%changelog
* Wed Feb 12 2003 Roger <roger@eskimo.com> 0.a8-2mdk
- Added the mrw gimp plugin to the rpm. (packaging error corrected)

* Wed Jan 29 2003 Roger <roger@eskimo.com> 0.a8-1mdk
- 0.a8
- The gimp plugin will not compile with -fnexceptions cflag.
- Initial package and untested.
