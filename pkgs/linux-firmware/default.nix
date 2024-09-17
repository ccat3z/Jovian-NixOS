{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20240813.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-In8mniK2qctvpH2ezFSR4R4yOiWCWhZJH13p4sc+X6M=";
  };

  outputHash = "sha256-Vdvedz87dJYQ5+tzmQZzeo/8zCUJ86/XXexaH7AZRXU=";
})
