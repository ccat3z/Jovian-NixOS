{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20240813.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-In8mniK2qctvpH2ezFSR4R4yOiWCWhZJH13p4sc+X6M=";
  };

  # FIXME: workaround newer linux-firmware needing `install dedup`
  # and this linux-firmware being too old to have `dedup`
  installTargets = [ "install" ];
})
