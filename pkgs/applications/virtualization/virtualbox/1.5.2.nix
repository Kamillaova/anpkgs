args : with args;
	with builderDefs {
		src = /* put a fetchurl here */
		fetchurl {
			url = https://www.virtualbox.org/download/1.5.2/VirtualBox-1.5.2_OSE.tar.bz2;
			sha256 = "1g9rvkqjcsfx36gwk6i9c0bml6053xx2mdn1sn7vyyy0sgwkwk53";
		};
		buildInputs = [libXcursor bridge_utils umlutilities kernelHeaders 
		      wine jre libxslt libIDL SDL qt3 openssl zlib];
		configureFlags = [];
	} null; /* null is a terminator for sumArgs */
stdenv.mkDerivation rec {
	name = "VirtualBox-"+version;
	builder = writeScript (name + "-builder")
		(textClosure [doConfigure doMakeInstall doForceShare doPropagate]);
	meta = {
		description = "
		Virtual Box is just software for running virtual machines. 
";
	};
}
