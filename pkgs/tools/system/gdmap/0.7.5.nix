args : with args;
	with builderDefs {
		src = /* put a fetchurl here */
		fetchurl {
			url = https://dfn.dl.sourceforge.net/sourceforge/gdmap/gdmap-0.7.5.tar.gz;
			sha256 = "0vxfgz1bq0jvny6dy7dkzg2kl56plrxby6c4y5d6bv4bq2xd6v26";
		};

		buildInputs = [gtk pkgconfig libxml2 intltool];
		configureFlags = [];
	} null; /* null is a terminator for sumArgs */
stdenv.mkDerivation rec {
	name = "gdmap"+version;
	builder = writeScript (name + "-builder")
		(textClosure [doConfigure doMakeInstall doForceShare doPropagate]);
	meta = {
		description = "
	Recursive rectangle map of disk usage.	
";
	};
}
