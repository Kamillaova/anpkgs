args: with args;
stdenv.mkDerivation {
  name = "timidity-2.13.0";

  src = fetchurl {
    url = https://ovh.dl.sourceforge.net/sourceforge/timidity/TiMidity++-2.13.0.tar.bz2;
    sha256 = "1jbmk0m375fh5nj2awqzns7pdjbi7dxpjdwcix04zipfcilppbmf";
  };

  instruments = 
	fetchurl {
		url = https://www.csee.umbc.edu/pub/midia/instruments.tar.gz;
		sha256 = "0lsh9l8l5h46z0y8ybsjd4pf6c22n33jsjvapfv3rjlfnasnqw67";
	};

  buildInputs =[alsaLib];

  config=./timidity.cfg;

  postInstall = "mkdir -p \$out/share/timidity/; 
		cp \$config \$out/share/timidity/timidity.cfg; 
		tar -xf \$instruments -C \$out/share/timidity/; 
	";

  meta = {
    description = "
	TiMidity - software MIDI renderer.
";
  };
}

