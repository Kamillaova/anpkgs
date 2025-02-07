{ stdenv, fetchurl, aterm, db4, perl, curl, bzip2, openssl ? null
, storeDir ? "/nix/store"
, stateDir ? "/nix/var"
, src
, preConfigure ? ""
, autoconf ? null, automake ? null, libtool ? null
, bison ? null
, flex ? null
, w3m ? null
, docbook5_xsl ? null, libxslt ? null
, docbook5 ? null, docbook_xml_dtd_43 ? null 
, configureFlags ? []
}:

stdenv.mkDerivation {
  name = "nix-custom";
  
  inherit src;

  buildInputs = [perl curl openssl] 
  	++ (if automake != null then [automake] else [])
  	++ (if autoconf != null then [autoconf] else [])
  	++ (if libtool != null then [libtool] else [])
  	++ (if bison != null then [bison] else [])
  	++ (if flex != null then [flex] else [])
  	++ (if docbook5_xsl != null then [docbook5_xsl] else [])
  	++ (if libxslt != null then [libxslt] else [])
  	++ (if docbook5 != null then [docbook5] else [])
  	++ (if docbook_xml_dtd_43 != null then [docbook_xml_dtd_43] else [])
  	++ (if w3m != null then [w3m] else [])
  ;

  inherit preConfigure;

  configureFlags = ["
    --with-store-dir=${storeDir} --localstatedir=${stateDir}
    --with-aterm=${aterm} --with-bdb=${db4} --with-bzip2=${bzip2}
    --disable-init-state"] ++ configureFlags ;

  meta = {
    description = "The Nix Deployment System";
    homepage = https://tarballs.nixos.org/;
    license = "LGPL";
  };
}
