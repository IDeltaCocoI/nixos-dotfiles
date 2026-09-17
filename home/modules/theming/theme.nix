{ pkgs }:

{
  _module.args.theme = {
    font = {
      name = "0xProto Nerd Font";
      package = pkgs.nerd-fonts._0xproto;
      size = 12.0;
    };
  };
}
