args : with args;
	with builderDefs {
		src = /* put a fetchurl here */
		fetchurl {
			url = https://fy.chalmers.se/~appro/linux/DVD+RW/tools/dvd+rw-tools-7.0.tar.gz;
			sha256 = "08hljn2vfn794dfrfpp3m245dbpb6nhk40igfpqm6wg9qimc9zy9";
		};

		buildInputs = [cdrkit m4];
		configureFlags = [];
		makeFlags = [" prefix=\$out "];
	} null; /* null is a terminator for sumArgs */
let 
	preBuild = FullDepEntry ("
		sed -e 's@/usr/local@'\$out'@g' -i Makefile.m4 Makefile
	") [minInit doUnpack];
in
stdenv.mkDerivation rec {
	name = "dvd+rw-tools-"+version;
	builder = writeScript (name + "-builder")
		(textClosure [preBuild doMakeInstall doForceShare doPropagate]);
	meta = {
		description = "
	DVD+RW tools.
";
	};
}
