{
  programs.floorp = {
    enable = true;
    profiles = {
      user = {
        name = "user";
        settings = {
          "browser.tabs.inTitlebar" = 1;
          "browser.uiCustomization.state" = ''
            {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["treestyletab_piro_sakura_ne_jp-browser-action"],"nav-bar":["sidebar-button","history-panelmenu","sidebar-reverse-position-toolbar","stop-reload-button","customizableui-special-spring1","developer-button","customizableui-special-spring8","urlbar-container","customizableui-special-spring9","customizableui-special-spring6","back-button","forward-button","customizableui-special-spring2","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button","profile-manager"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["workspaces-toolbar-button","tabbrowser-tabs","new-tab-button","alltabs-button","firefox-view-button"],"PersonalToolbar":["import-button","personal-bookmarks"],"statusBar":["screenshot-button","fullscreen-button","status-text"]},"seen":["developer-button","sidebar-reverse-position-toolbar","undo-closed-tab","profile-manager","workspaces-toolbar-button","treestyletab_piro_sakura_ne_jp-browser-action"],"dirtyAreaCache":["nav-bar","statusBar","TabsToolbar","PersonalToolbar","toolbar-menubar","unified-extensions-area"],"currentVersion":20,"newElementCount":11}'';
          "browser.uidensity" = 1;
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "floorp.browser.sidebar.enable" = false;
          "floorp.browser.sidebar2.hide.to.unload.panel.enabled" = true;
          "floorp.browser.tabbar.settings" = 2;
          "floorp.browser.tabs.verticaltab" = true;
          "floorp.browser.tabs.verticaltab.right" = true;
          "floorp.browser.user.interface" = 1;
          "floorp.chrome.theme.mode" = 1;
          "floorp.tabbar.style" = 2;

        };

      };
    };
  };
  stylix.targets.floorp = {
    enable = true;
    profileNames = [ "user" ];
  };
}
