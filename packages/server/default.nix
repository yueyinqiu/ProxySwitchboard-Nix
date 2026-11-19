{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "proxy-switchboard-server";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "yueyinqiu";
    repo = "ProxySwitchboard";
    rev = "v${finalAttrs.version}";
    hash = "sha256-XGF70h9uQgFje8IpeuJwoIDUVuX+401W7TRrDpdKvEU=";
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