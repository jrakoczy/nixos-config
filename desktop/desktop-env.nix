{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      desktopManager = {
        default = "none";
        xterm.enable = false;
      };

      windowManager.i3 = {
        enable = true;

        # use customized i3 version.
        package = pkgs.i3-gaps;
      };

      displayManager = {
        lightdm.background = "#ededeb";
        job.environment = {

          # Scale all windows by specified factor.
          GDK_SCALE = "2";

          # Compensate GDK_SCALE to make using scale-aware and scale-unaware
          # applications together possible.
          GDK_DPI_SCALE = "0.5";

          # Honor screen DPI in QT applications.
          QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        };

        # Restore a colorscheme and set a wallpaper.
        sessionCommands = ''
          wal -R
        '';
      };
    };

    # The compton configuration to fix i3 artifacts.
    # based on github.com/dylanaraps/dotfiles.
    compton = {
      enable = true;

      # vertical synchronization using the specified method.
      # this allows to avoid screen tearing.
      vSync = true;
      refreshRate = 60;
      shadow = true;
      shadowOpacity = "0.4";
      shadowOffsets = [ (-8) (-8) ];

      # mark-wmwin-focued - try to detect wm windows and mark them as active.
      # mark-ovredir-focused — mark all non-wm but override-redirect windows active
      #                        (e.g. menus).
      # use-ewmh-active-win — use ewmh _net_wm_active_window to determine which
      #                       window is focused instead of using focusin/out events.
      # detect-rounded-corners — detect rounded corners and treat them as rectangular
      #                          when --shadow-ignore-shaped is on.
      # detect-client-opacity —  detect _net_wm_opacity on client windows, useful for
      #                          window managers not passing _net_wm_opacity of client
      #                          windows to frame windows. this prevents opacity being
      #                          ignored for some apps.
      # paint-on-overlay — painting on x composite overlay window.
      # sw-opti — repaint at most once every 1/refresh_rate second. since vsync "opengl"
      #           already does it, we disable this option.
      # detect-transient —  use wm_transient_for to group windows, and consider windows
      #                     in the same group focused at the same time.
      # detect-client-leader — use wm_client_leader to group windows, and consider windows
      #                        in the same group focused at the same time. wm_transient_for
      #                        has higher priority if --detect-transient is enabled, too.
      settings = {
        mark-wmin-focused = true;
        mark-ovredir-focused = true;
        use-ewmh-active-win = true;
        detect-rounded-corners = false;
        detect-client-opacity = false;
        paint-on-overlay = true;
        sw-opti = false;
        detect-transient = true;
        detect-client-leader = true;
      };
    };
  };

  fonts = {

    fonts = with pkgs; [
      roboto
      roboto-mono
      iosevka
    ];

    fontconfig = {

      hinting = {
        # disable autohinter for unhinted fonts.
        autohint = false;
      };

      defaultFonts = {
        sansSerif = [ "iosevka" ];
        monospace = [ "iosevka" ];
      };
    };
  };
}
