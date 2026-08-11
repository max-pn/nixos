{
  ...
}:
{
  programs.firefox = {
    enable = true;

    profiles = {
      personal = {
        id = 0;
        name = "Personal";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://google.com";
        };
      };

      unisg = {
        id = 1;
        name = "Uni SG";
      };
    };
  };
}
