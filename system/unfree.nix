{ lib, ... }:
pkg:
builtins.elem (lib.getName pkg) [
  "zsh-abbr"
  "rar"
]
