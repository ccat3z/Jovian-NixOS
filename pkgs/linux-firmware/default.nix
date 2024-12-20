{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20241205.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-Ejww1PK8hKjoRiHt/CEz2sS9MSV2ZoMaFYpZPGJCFEA=";
  };

  # FIXME: workaround newer linux-firmware needing `install dedup`
  # and this linux-firmware being too old to have `dedup`
  installTargets = [ "install" ];
})
