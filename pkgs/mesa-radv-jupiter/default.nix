{ stdenv, mesa, fetchFromGitHub }:
let
  version = "24.3.0";
  jupiterVersion = "steamos-24.11.3";
in stdenv.mkDerivation {
  pname = "mesa";
  version = "${version}.${jupiterVersion}";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "mesa";
    rev = jupiterVersion;
    hash = "sha256-c2PYFC6pexYzwdkCeRZ2VIfcmu23fezb06MKAQ+0Jo8=";
  };

  inherit (mesa) buildInputs nativeBuildInputs propagatedBuildInputs;

  separateDebugInfo = true;

  mesonAutoFeatures = "auto";

  # See https://github.com/Jovian-Experiments/PKGBUILDs-mirror/blob/jupiter-main/mesa-radv/PKGBUILD
  mesonFlags = [
    "-D b_ndebug=true"
    "-D b_lto=false"
    "-D platforms=x11,wayland"
    "-D gallium-drivers="
    "-D gallium-vdpau=disabled"
    "-D gallium-va=disabled"
    "-D gallium-xa=disabled"
    "-D android-libbacktrace=disabled"
    "-D vulkan-drivers=amd"
    "-D vulkan-layers="
    "-D egl=disabled"
    "-D gbm=disabled"
    "-D gles1=disabled"
    "-D gles2=disabled"
    "-D glvnd=disabled"
    "-D glx=disabled"
    "-D libunwind=enabled"
    "-D llvm=enabled"
    "-D lmsensors=disabled"
    "-D osmesa=false"
    "-D microsoft-clc=disabled"
    "-D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc"
    "-D valgrind=enabled"
    "-D intel-rt=disabled"
    "-D radv-build-id=848e305d63fe820829c18b37379991cfe51f5a26"
  ];
}