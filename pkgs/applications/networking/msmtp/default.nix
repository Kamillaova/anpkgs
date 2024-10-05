args:
args.stdenv.mkDerivation {
  name = "msmtp-1.4.13";

  src = args.fetchurl {
    url = https://dfn.dl.sourceforge.net/sourceforge/msmtp/msmtp-1.4.13.tar.bz2;
    sha256 = "1x8q8dhcpnjym3icz6070l13hz98fvdvgc5j5psj4pmxbswx0r4p";
  };

  buildInputs =(with args; []);

  meta = { 
      description = "a MUA";
      homepage = https://msmtp.sourceforge.net/;
      license = "GPL";
    }; 
}
