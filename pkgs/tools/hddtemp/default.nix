args:
args.stdenv.mkDerivation {
  name = "hddtemp-0.3-beta15";

  db = args.fetchurl{
              url = https://download.savannah.nongnu.org/releases/hddtemp/hddtemp.db;
              sha256 = "1fr6qgns6qv7cr40lic5yqwkkc7yjmmgx8j0z6d93csg3smzhhya";
       };
  src = args.fetchurl {
            url = https://download.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.tar.bz2;
            sha256 = "0nzgg4nl8zm9023wp4dg007z6x3ir60rwbcapr9ks2al81c431b1";
  };

  configurePhase = "
    ensureDir \$out/nix-support
    cp \$db \$out/nix-support/hddtemp.db
    ./configure --prefix=\$out --with-db-path=\$out/nix-support/hddtemp.db
  "; 

  buildInputs =(with args; []);

  meta = { 
      description = "shows the harddisk temperature";
      homepage = https://savannah.nongnu.org/projects/hddtemp/;
      license = "GPL2";
  };
}
