{stdenv, fetchurl, vim}:

stdenv.mkDerivation {
  name = "cvs-1.12.13";

  src = fetchurl {
    url = https://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2;
    md5 = "956ab476ce276c2d19d583e227dbdbea";
  };
  buildInputs = [vim];
}
