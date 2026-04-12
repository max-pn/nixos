{ mkSystem }:
{
  darwin = mkSystem "darwin" {
    system = "aarch64-darwin";
    user = "max-pn";
    darwin = true;
  };
}
