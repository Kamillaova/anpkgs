args: with args;

stdenv.mkDerivation {
	name = "libidn-1.2";
	src = fetchurl {
		url = https://ftp.gnu.org/gnu/libidn/libidn-1.2.tar.gz;
		sha256 = "0cip97xskrsfp6v1v966jb921srl1s65a5d8s0l73s85yww55n73";
	};

	meta = {
		homepage = https://www.gnu.org/software/libidn;
		description = "GNU Libidn library for internationalized domain names";
		license = "LGPL";
	};
}
