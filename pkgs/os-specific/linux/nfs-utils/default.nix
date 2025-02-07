args:
args.stdenv.mkDerivation {
  name = "nfs-utils-1.1.1";

  src = args.fetchurl {
    url = mirror://sourceforge/nfs/nfs-utils-1.1.1.tar.gz;
    sha256 = "0aa434cv7lgbrhks0rzhwxvbk2zsa17kjwxqjrrh87zrv9d2sr1x";
  };

  buildInputs =(with args; [kernelHeaders tcp_wrapper]);

  meta = { 
      description = "nfs utils";
      homepage = https://nfs.sourceforge.net/;
      license = "GPL2";
  };
}
