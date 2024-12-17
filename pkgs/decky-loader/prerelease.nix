{ 
  decky-loader,
  fetchFromGitHub,
  pnpm,
}:
decky-loader.overridePythonAttrs rec {
  pname = "decky-loader";
  version = "3.0.5-pre1";

  src = fetchFromGitHub {
    owner = "SteamDeckHomebrew";
    repo = "decky-loader";
    rev = "v${version}";
    hash = "sha256-PViSR4q3ZLo0pnrbqzWSOHgYy2QlkKKLWtQcflBIkdU=";
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    sourceRoot = "${src.name}/frontend";
    hash = "sha256-26p0RoMfuZRVgTnYWdWK2qJwEJXeGWsBkVhp5TQyfGw=";
  };
}
