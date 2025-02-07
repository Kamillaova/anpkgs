{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "gnused-4.1.5";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/sed/sed-4.1.5.tar.gz;
    md5 = "7a1cbbbb3341287308e140bd4834c3ba";
  };
  # !!! hack: this should go away in gnused > 4.1.5
  patches = [./gettext-fix.patch];
}
