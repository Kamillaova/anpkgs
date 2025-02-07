args: with args;
stdenv.mkDerivation {
  name = "EProver-0.999";

  src = 
	fetchurl {
		name = "E-0.999.tar.gz";
		url = https://www4.informatik.tu-muenchen.de/~schulz/WORK/E_DOWNLOAD/V_0.999/E.tgz;
		sha256 = "1zm1xip840hlam60kqk6xf0ikvyk7ch3ql1ac6wb68dx2l6hyhxv";
	};

  buildInputs =[which tetex];

  preConfigure = "sed -e 's@^EXECPATH\\s.*@EXECPATH = '\$out'/bin@' -i Makefile.vars";

  buildPhase = "make install";
  installCommand = "mkdir -p \$out/bin; make install-exec; make documentation ; 
		mkdir -p \$out/share/doc ; cp -r DOC \$out/share/doc/EProver;
		echo eproof -xAuto --tstp-in --tstp-out '\"\$@\"' >\$out/bin/eproof-tptp; 
		chmod a+x \$out/bin/eproof-tptp; ";

  meta = {
    description = "
	E automated theorem prover.
";
  };
}
