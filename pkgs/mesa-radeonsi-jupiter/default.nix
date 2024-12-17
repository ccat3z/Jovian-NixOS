{ mesa, fetchpatch }:
# Patches from nixpkgs mesa..vendor radeonsi branch
mesa.overrideAttrs(old: {
  patches = old.patches ++ [
    # Cherry-pick the swapchain override bits from the Valve 24.3 branch
    (fetchpatch {
      url = "https://github.com/Jovian-Experiments/mesa/commit/27482ce2030cc4249908382fb4e2092134135fdb.patch";
      hash = "sha256-tQoGN/88sdPDQmscfkPKulPasU2tLeRekWG9xWF/BsQ=";
    })
    # Disable glthread by default
    (fetchpatch {
      url = "https://github.com/Jovian-Experiments/mesa/commit/09d9c2fd7f69fbe59aab0bb53438d3446ea90dd4.patch";
      hash = "sha256-y0wGWVBQiWd2hOqiqDIKP9VERNSP4owuPGjnqUTNy68=";
    })
  ];
})
