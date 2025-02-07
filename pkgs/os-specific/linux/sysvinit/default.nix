{stdenv, fetchurl, withoutInitTools ? false}:

stdenv.mkDerivation {
  name = if withoutInitTools then "sysvtools-2.86" else "sysvinit-2.86";
  builder = ./builder.sh;
  src = fetchurl {
    url = https://ftp.cistron.nl/pub/people/miquels/sysvinit/sysvinit-2.86.tar.gz;
    sha256 = "1n3rnsynlaw7zyp2q5r7c49yvi1xr3669ick540gz73xw7x9hpq3";
  };
  patches = [./sysvinit-2.85-exec.patch];
  inherit withoutInitTools;
}
