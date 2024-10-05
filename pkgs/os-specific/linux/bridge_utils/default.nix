args:
args.stdenv.mkDerivation {
  name = "bridge-utils-1.2";

  src = args.fetchurl {
    url = mirror://sourceforge/bridge/bridge-utils-1.2.tar.gz;
    sha256 = "0jg3z51c2c34byg4zi39j9g4b66js5kanjhid77hpa0jdfmryfy9";
  };

  buildInputs =(with args; [autoconf automake]);

  preConfigure="autoreconf";

  meta = { 
      description = "https://sourceforge.net/projects/bridge/";
      homepage = [ "https://www.linux-foundation.org/en/Net:Bridge/" "https://sourceforge.net/projects/bridge/" ];
      license = "GPL";
  };
}
