args: with args;
stdenv.mkDerivation {
	name = "ilmbase-1.0.1";
	src = fetchurl {
		url = https://download.savannah.nongnu.org/releases/openexr/ilmbase-1.0.1.tar.gz;
		sha256 = "0z9r3r0bxyhgwhkdwln0dg1lnxz691qnjygrqlg3jym34rxzq52g";
	};
	configureFlags = "--enable-shared --disable-static";
}
