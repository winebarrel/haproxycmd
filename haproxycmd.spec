%define  debug_package %{nil}

Name:   haproxycmd
Version:  0.1.0
Release:  1%{?dist}
Summary:  HAProxy Unix Socket commands CLI Edit

Group:    Development/Tools
License:  MIT
URL:    https://github.com/winebarrel/haproxycmd
Source0:  %{name}.tar.gz
# https://github.com/winebarrel/haproxycmd/archive/%{version}.tar.gz

%description
HAProxy Unix Socket commands CLI Edit

%prep
%setup -q -n src

%build
make

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/bin
install -m 755 haproxycmd %{buildroot}/usr/bin/

%files
%defattr(755,root,root,-)
/usr/bin/haproxycmd
