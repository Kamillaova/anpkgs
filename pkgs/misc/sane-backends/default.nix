{stdenv, fetchurl, hotplugSupport ? false, libusb ? null,
	gt68xxFirmware ? null}:

assert hotplugSupport -> stdenv.system == "i686-linux";

stdenv.mkDerivation {
  name = "sane-backends-1.0.18";
  builder = ./builder.sh;
  src = fetchurl {
    url = https://ftp.sane-project.org/pub/sane/sane-backends-1.0.18/sane-backends-1.0.18.tar.gz;
    md5 = "7ca7e2908e24721471de92cf40c75e60";
  };
  udevSupport = hotplugSupport;

  buildInputs = (if libusb != null then [libusb] else []);

  preInstall = (if gt68xxFirmware != null then 
	"mkdir -p \${out}/share/sane/gt68xx ; ln -s " +  
	(gt68xxFirmware {inherit fetchurl;})+ " \${out}/share/sane/gt68xx/PS1fw.usb "
	 else "");
}
