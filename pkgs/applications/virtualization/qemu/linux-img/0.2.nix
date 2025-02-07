
args : with args;
	with builderDefs {
		src = /* put a fetchurl here */
		fetchurl {
			url = https://fabrice.bellard.free.fr/qemu/linux-0.2.img.bz2;
			sha256 = "08xlwy1908chpc4fsqy2v13zi25dapk0ybrd43fj95v67kdj5hj1";
		};
		buildInputs = [];
		configureFlags = [];
	} null; /* null is a terminator for sumArgs */
let 
doCopy = FullDepEntry ("
  ensureDir \$out/share/qemu-images
  cp linux-${version}.img  \$out/share/qemu-images/
") [minInit doUnpack defEnsureDir];
in
stdenv.mkDerivation rec {
	name = "QEmu-Linux-Image-"+version;
	builder = writeScript (name + "-builder")
		(textClosure [doCopy doForceShare doPropagate]);
	meta = {
		description = "
		${abort "Write a description"}
";
	};
}
