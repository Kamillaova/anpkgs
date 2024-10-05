{stdenv, fetchurl, libdvdcss}:

stdenv.mkDerivation {
  name = "libdvdread-0.9.6";
  src = fetchurl {
    url = https://www.dtek.chalmers.se/groups/dvd/dist/libdvdread-0.9.6.tar.gz;
    md5 = "329401b84ad0b00aaccaad58f2fc393c";
  };
  configureFlags = "--with-libdvdcss=${libdvdcss}";
  inherit libdvdcss;
}
