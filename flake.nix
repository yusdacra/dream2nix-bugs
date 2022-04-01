{
  inputs.dream2nix.url = "github:nix-community/dream2nix/f7c034d4eee5d3cf8df4baaad59e715a0cf24db7";
  outputs = { self, dream2nix }@inputs:
    let
      dream2nix = inputs.dream2nix.lib.init {
        # modify according to your supported systems
        systems = [ "x86_64-linux" ];
        config.projectRoot = ./. ;
      };
    in dream2nix.makeFlakeOutputs {
      pname = "test";
      source = ./.;
    };
}
