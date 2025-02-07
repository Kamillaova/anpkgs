{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "gzip-1.3.12";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/gzip/gzip-1.3.12.tar.gz;
    sha256 = "1bw7sm68xjlnlzgcx66hnw80ac1qqyvhw0vw27zilgbzbzh5nmiz";
  };
	patches = [./gnulib-futimens.patch];
}
