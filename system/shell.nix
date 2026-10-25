{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.userConfig) flakePath;
  zshPlugin = plugin: {
    name = plugin;
    src = pkgs.${plugin};
    file = "share/zsh/site-functions/${plugin}.plugin.zsh";
  };
  zshPlugins = plugins: map zshPlugin plugins;

  shellAbbrs = { };
  shellBanner = "cutefetch -m cat";
  mkBinScript = (name: command: lib.getExe (pkgs.writeShellScriptBin name command));
  extraBinScripts = builtins.mapAttrs mkBinScript {
    wuji = "sudo -H nix-collect-garbage -d && nix-collect-garbage -d";
    yup = "nix flake update --flake ${flakePath} && nh os boot";
    fan = "du -hd1 \"$1\" | sort -hr";
    unly = "curl -Is \"$1\" | grep ^location | cut -d \" \" -f 2";
    etch = "sudo dd status=progress conv=fsync bs=4M of=/dev/$1 if=$2";
    vizeval = ''
      nix eval $1 --eval-profiler flamegraph
      ${lib.getExe' pkgs.inferno "inferno-flamegraph"} --width 10000 < nix.profile > vizeval.svg
    '';
  };
in
{
  home.shellAliases = extraBinScripts // {
    # shell conveniences
    x = "exit";
    clr = "clear";
    cls = "clear";
    kat = "bat -pp";
    top = "btm --basic";
    ez = "eza -1 --icons=never";
    ezl = "eza -1l";
    lessr = "less -R";
    tree = "eza --tree";
    py = "ptpython";
    cf = "cutefetch";
    bf = "cutefetch -m bunny";
    sf = "cutefetch -m simple";
    nf = "cutefetch -m text";
    gf = "grep -rn . -e";

    # editing related
    e = "hx";
    eos = "e ${flakePath}";

    # package management
    yin = "nix-shell -p";
    yang = "nh search";

    # misc
    lg = lib.getExe pkgs.lazygit;
    # ldk = lib.getExe pkgs.lazydocker;
  };

  programs = {
    zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      completionInit = "autoload -U compinit && compinit -u";
      defaultKeymap = "viins";
      autosuggestion.enable = true;
      autosuggestion.strategy = [
        "history"
        "completion"
        "match_prev_cmd"
      ];
      syntaxHighlighting.enable = true;
      historySubstringSearch = {
        enable = true;
        searchUpKey = [ "^[OA" ];
        searchDownKey = [ "^[OB" ];
      };
      history = {
        save = 1024;
        size = 2048;
        share = true;
        append = true;
        ignoreAllDups = true;
      };
      initContent = ''
        path+=( "$(go env GOPATH)/bin" "$HOME/.local/bin" )
        ${shellBanner}

        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )
      '';
      shellAliases = {
        src = "exec zsh";
        fm = "f() { cd \"$(${lib.getExe pkgs.lf} -print-last-dir \"$@\")\" }; f";
      };
      dirHashes = {
        nixos = flakePath;
      };
      zsh-abbr = {
        enable = true;
        abbreviations = shellAbbrs;
      };
      plugins = zshPlugins [
        "zsh-autosuggestions-abbreviations-strategy"
      ];
    };

    starship = {
      enable = with config.programs; fish.enable || nushell.enable;
      enableZshIntegration = false;
      settings = {
        add_newline = false;
        cmd_duration = {
          format = "[$duration]($style) ";
          min_time = 5000;
        };
        character = {
          success_symbol = "[\\(λ\\)](bold #ff77cc)";
          error_symbol = "[\\(λ\\)](bold #ee7777)";
          vicmd_symbol = "[<λ>](bold #ff77cc)";
        };
        directory = {
          truncation_length = 1;
          style = "bold #44ccff";
          format = "[$path]($style)[$read_only]($read_only_style) ";
        };
        git_branch.format = "[<$branch(:$remote_branch)>]($style) ";
        status = {
          disabled = false;
          format = "[\\[$status\\] ]($style)";
        };
        format = lib.concatStrings [
          "$status"
          "$character"
        ];
        right_format = lib.concatStrings [
          "$cmd_duration"
          "$git_status"
          "$git_branch"
          "$directory"
        ];
      };
    };
  };
}
