{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs.tmux = {
    enable = true;

    prefix = "C-s";
    mouse = true;
    keyMode = "vi";
    baseIndex = 1;
    escapeTime = 0;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      unbind r
      bind r source-file ~/.tmux.conf

      set -ag terminal-overrides ",xterm-256color:RGB"

      bind-key h split-window -v -c "#{pane_current_path}"
      bind-key v split-window -h -c "#{pane_current_path}"

      # change bindings to vi for copy mode
      setw -g mode-keys vi

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi V send -X select-line
      bind -T copy-mode-vi y send -X copy-selection-and-cancel
      bind -T copy-mode-vi q send -X cancel
      bind -T copy-mode-vi Escape send -X cancel

      # activate status bar top
      set -g status on
      set-option -g status-position top

      # set colors fitting to theme
      set -g status-bg "#22252a"
      set -g status-fg white
      setw -g window-status-style fg=white,bg="#22252a"
      setw -g window-status-current-style fg=black,bg=yellow

      # remove all elements of status bar
      set -g status-left ""

      # add current index to the right of the status bar
      set -g status-right "#I"

      # start index at 1
      setw -g pane-base-index 1

      # add support for image.nvim
      set -gq allow-passthrough on
      set -g visual-activity off
      set-option -g focus-events on

      # TPM bits from your tmux.conf are not needed in Home Manager
      # because plugins are managed through programs.tmux.plugins
    '';
  };
}
