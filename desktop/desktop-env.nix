{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      windowManager.i3 = {
        enable = true;

        # Use customized i3 version.
        package = pkgs.i3-gaps;
      };
    };

    # The Compton configuration to fix i3 artifacts.
    # Based on github.com/dylanaraps/dotfiles.
    compton = {
      enable = true;

      # Vertical synchronization using the specified method.
      # This allows to avoid screen tearing.
      vSync = "opengl";

      # mark-wmwin-focued - try to detect WM windows and mark them as active.
      # mark-ovredir-focused — mark all non-WM but override-redirect windows active
      #                        (e.g. menus).
      # use-ewmh-active-win — use EWMH _NET_WM_ACTIVE_WINDOW to determine which
      #                       window is focused instead of using FocusIn/Out events.
      # detect-rounded-corners — detect rounded corners and treat them as rectangular 
      #                          when --shadow-ignore-shaped is on.
      # detect-client-opacity —  detect _NET_WM_OPACITY on client windows, useful for 
      #                          window managers not passing _NET_WM_OPACITY of client 
      #                          windows to frame windows. This prevents opacity being 
      #                          ignored for some apps.
      # paint-on-overlay — painting on X Composite overlay window.
      # sw-opti — repaint at most once every 1/refresh_rate second. Since vSync "opengl"
      #           already does it, we disable this option.
      # detect-transient —  Use WM_TRANSIENT_FOR to group windows, and consider windows 
      #                     in the same group focused at the same time.
      # detect-client-leader — use WM_CLIENT_LEADER to group windows, and consider windows 
      #                        in the same group focused at the same time. WM_TRANSIENT_FOR 
      #                        has higher priority if --detect-transient is enabled, too.
      extraOptions = ''
        mark-wmin-focused = true
        mark-ovredir-focused = true
        use-ewmh-active-win = true
        detect-rounded-corners = false
        detect-client-opacity = false
        refresh-rate = 60
        paint-on-overlay = true
        sw-opti = false
        detect-transient = true
        detect-client-leader = true
      '';
    };
  };
}
