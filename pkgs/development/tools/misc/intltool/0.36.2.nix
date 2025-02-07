args : with args;
	with builderDefs {
		src = /* put a fetchurl here */
	fetchurl {
		url = https://ftp.gnome.org/pub/gnome/sources/intltool/0.36/intltool-0.36.2.tar.bz2;
		sha256 = "0cfblqz3k5s4rsw6rx9f5v3izsrmrs96293rb7bd02vijbah9gxj";
	};

		propagatedBuildInputs = [perl perlXMLParser];
		configureFlags = [];
	} null; /* null is a terminator for sumArgs */
stdenv.mkDerivation rec {
	name = "intltool-0.36.2";
	builder = writeScript (name + "-builder")
		(textClosure [doConfigure doMakeInstall doPropagate doForceShare]);
	inherit propagatedBuildInputs;
	meta = {
		description = "
	Internalization tool for XML.
";
	};
}
