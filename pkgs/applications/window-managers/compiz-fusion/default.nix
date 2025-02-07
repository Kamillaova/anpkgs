args : with args;
rec
{
        selectVersion = dir: import (dir + "/${args.version}.nix");
	bcop = selectVersion ./bcop args;
	libcompizconfig = selectVersion ./libcompizconfig (args // {inherit bcop;});
	configBackendGConf = selectVersion ./config-backend (args // {inherit bcop libcompizconfig;});
	compizConfigPython = selectVersion ./compizconfig-python (args // {inherit libcompizconfig 
		bcop pyrex configBackendGConf;});
	ccsm = selectVersion ./ccsm (args // {inherit libcompizconfig bcop compizConfigPython configBackendGConf;});
	pluginsMain = selectVersion ./main (args //{inherit bcop ;});
	pluginsExtra = selectVersion ./extra (args //{inherit bcop pluginsMain;});
	compizManager = selectVersion ./compiz-manager (args // {inherit bcop ccsm;});
}
