{ stdenv, fetchurl, pkgconfig, gtk, perl, zip, libIDL, libXi
, libjpeg, libpng, zlib, cairo

, # If you want the resulting program to call itself "Thunderbird"
  # instead of "Mail", enable this option.  However, those
  # binaries may not be distributed without permission from the
  # Mozilla Foundation, see
  # https://www.mozilla.org/foundation/trademarks/.
  enableOfficialBranding ? false
    
}:

stdenv.mkDerivation {
  name = "thunderbird-2.0.0.9";

  builder = ./builder.sh;
  src = fetchurl {
    url = https://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/2.0.0.9/source/thunderbird-2.0.0.9-source.tar.bz2;
    sha1 = "fede9db98f25adb978b84129a6d15a4dbe6bbb3e";
  };

  buildInputs = [
    pkgconfig gtk perl zip libIDL libXi libjpeg libpng zlib cairo
  ];

  patches = [
    # Ugh, inexplicable problem since GTK+ 2.10.  Probably a Firefox
    # bug, but I don't know.  See
    # https://lists.gobolinux.org/pipermail/gobolinux-users/2007-January/004344.html
    ./xlibs.patch
  ];

  configureFlags = [
    "--enable-application=mail"
    "--enable-optimize"
    "--disable-debug"
    "--enable-xft"
    "--disable-freetype2"
    "--enable-svg"
    "--enable-canvas"
    "--enable-strip"
    "--enable-default-toolkit=gtk2"
    "--with-system-jpeg"
    "--with-system-png"
    "--with-system-zlib"
    "--enable-system-cairo"
    "--enable-extensions=default"
  ]
  ++ (if enableOfficialBranding then ["--enable-official-branding"] else []);

  meta = {
    description = "Mozilla Thunderbird, a full-featured email client";
  };
}
