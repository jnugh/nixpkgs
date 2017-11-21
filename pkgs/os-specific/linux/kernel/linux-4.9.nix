{ stdenv, hostPlatform, fetchurl, perl, buildLinux, ... } @ args:

import ./generic.nix (args // rec {
  version = "4.9.64";
  extraMeta.branch = "4.9";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v4.x/linux-${version}.tar.xz";
    sha256 = "19627021bdcaeb1046ad0054b80e99e33fa3fc57d20f39bc147df3e86d3830c0";
  };
} // (args.argsOverride or {}))
