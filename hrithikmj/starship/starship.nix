{ lib, config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[](#d65d0e)"
        "$username"
        "[](bg:#d79921 fg:#d65d0e)"
        "$directory"
        "[](fg:#d79921 bg:#689d6a)"
        "$git_branch"
        "$git_status"
        "[](fg:#689d6a bg:#458588)"
        "$golang"
        "$python"
        "$nodejs"
        "$rust"
        "[](fg:#458588 bg:#665c54)"
        "$docker_context"
        "[](fg:#665c54 bg:#3c3836)"
        "$time"
        "[](fg:#3c3836)"
        "$line_break$character"
      ];

      # Disable the blank line at the start of the prompt
      # add_newline = false

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      username = {
        show_always = true;
        style_user = "bg:#d65d0e fg:#fbf1c7";
        style_root = "bg:#d65d0e fg:#fbf1c7";
        format = "[ $user ]($style)";
        disabled = false;
      };
      os = {
        style = "bg:#d65d0e fg:#fbf1c7";
        disabled = false; # Disabled by default
      };
      directory = {
        style = "fg:#fbf1c7 bg:#d79921";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      directory.substitutions = {
        Documents = "󰈙";
        Downloads = "";
        Music = "󰝚";
        Pictures = "";
        Dev = "󰲋";
      };
      docker_context = {
        symbol = " ";
        style = "bg:#06969A";
        format = "[ $symbol $context ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#689d6a";
        format = "[[ $symbol $branch ](fg:#fbf1c7 bg:#689d6a)]($style)";
      };
      git_status = {
        style = "bg:#689d6a";
        format = "[[($all_status$ahead_behind )](fg:#fbf1c7 bg:#689d6a)]($style)";
      };
      golang =
        {
          symbol = "";
          style = "bg:#458588";
          format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#458588)]($style)";
        };
      nodejs = {
        symbol = "";
        style = "bg:#458588";
        format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#458588)]($style)";
      };
      rust =
        {
          symbol = "";
          style = "bg:#458588";
          format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#458588)]($style)";
        };
      python = {
        symbol = "";
        style = "bg:#458588";
        format = "[[ $symbol( $version) ](fg:#fbf1c7 bg:#458588)]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#3c3836";
        format = "[[  $time ](fg:#fbf1c7 bg:#3c3836)]($style)";
      };

      line_break = {
        disabled = false;
      };
      character = {
        disabled = false;
        success_symbol = "[](bold fg:#98971a)";
        error_symbol = "[](bold fg:#cc241d)";
        vimcmd_symbol = "[](bold fg:#98971a)";
        vimcmd_replace_one_symbol = "[](bold fg:#b16286)";
        vimcmd_replace_symbol = "[](bold fg:#b16286)";
        vimcmd_visual_symbol = "[](bold fg:#d79921)";
      };
    };
  };
}
