%define name crw
%define version 1.92
%define release 3mdk

Summary: This is a portable ANSI C program to convert raw image files from any digital camera into PPM format.
Name: %{name}
Version: %{version}
Release: %{release}
License: Copyright 2003
Group: Graphics
Source0: crw-1.92.tar.bz2
URL: http://www2.primushost.com/~dcoffin/powershot/index.html
#Requires:
Provides: %{name}-%{version}-%{release}
BuildRoot: %{_tmppath}/%{name}-buildroot
#BuildRequires:
Distribution: Mandrake
Vendor: Mandrakesoft
Packager: Roger <rogerx@san.rr.com>

%description
This is a portable ANSI C program to convert raw image files from
any digital camera into PPM format.  TIFF and CIFF parsing are
based upon public specifications, but no such documentation is
available for the raw sensor data, so writing this program has
been an immense effort.  *This build includes ljpeg_decode which 
is required for the Canon EOS-1D and some Kodak cameras.

%prep
rm -rf %buildroot
%setup -q

%build
%make
mkdir -p $RPM_BUILD_ROOT/usr/bin
make DESTDIR=$RPM_BUILD_ROOT install

%install
mkdir -p $RPM_BUILD_ROOT/usr/share/man/man1
chmod a+x $RPM_BUILD_ROOT/usr/bin/*
cp crw.1 $RPM_BUILD_ROOT/usr/share/man/man1
%makeinstall

%post

%clean
rm -rf %buildroot

%files
%defattr(-, root, root)
%doc README
%{_bindir}/*
%{_mandir}/man*/*

%changelog
* Wed Jan 22 2003 Roger <rogerx@san.rr.com> 1.92-3mdk
- seperate builds for crw were not needed.

* Sat Jan 18 2003 Roger <rogerx@san.rr.com> 1.92-2mdk
- Added manfile.
- Split and added a crw-ljpeg_decode version

* Thu Jan 16 2003 Roger <rogerx@san.rr.com> 1.92-1mdk
- Shiny new specfile.
- Added Makefile, README and specfile.

