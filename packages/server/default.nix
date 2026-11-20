{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "proxy-switchboard-server";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "yueyinqiu";
    repo = "ProxySwitchboard";
    rev = "v${finalAttrs.version}";
    hash = "sha256-KLWhU9NZxJwwc+u76k2b6kTs0a2NX1Oxr4rYMlPljwQ=";
  };

  projectFile = "src/ProxySwitchboard.Server/ProxySwitchboard.Server.csproj";
  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.aspnetcore_10_0;

  nugetDeps = ./deps.json;

  strictDeps = true;
  __structuredAttrs = true;

  meta = {
    description = "A local proxy whose upstream can be switched on the fly";
    homepage = "https://github.com/yueyinqiu/ProxySwitchboard";
    license = lib.licenses.mit;
    mainProgram = "ProxySwitchboard.Server";
    maintainers = [ ];
  };
})