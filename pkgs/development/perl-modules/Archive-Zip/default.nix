{fetchurl, perl}:

import ../generic perl {
  name = "Archive-Zip-1.16";
  src = fetchurl {
    url = https://tarballs.nixos.org/Archive-Zip-1.16.tar.gz;
    md5 = "e28dff400d07b1659d659d8dde7071f1";
  };
}
