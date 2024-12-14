{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.6";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.6-jupiter1.3";
    hash = "sha256-n3hZMwHZ+3NFAUMOxPZpXO7BCZMJ9m0Ggyc2aklfggI=";
  };
})
