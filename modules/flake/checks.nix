{ inputs, root, ... }:
{
  perSystem =
    { system, ... }:
    {
      checks = {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = root;
          hooks = {
            nixfmt-rfc-style = {
              enable = true;
              settings.width = 100;
            };

            typos = {
              enable = true;
              settings = {
                write = true;
              };
            };

            prettier = {
              enable = true;
              settings = {
                write = true;
              };
            };

            deadnix.enable = true;
            statix.enable = true;
          };
        };
      };
    };
}
