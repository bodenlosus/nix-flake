
{ pkgs, lib, config, ... }:

with config.lib.stylix.colors.withHashtag;

{
  home.file.obsidian-stylix-css = {
    enable = true;
    # THIS VALUE NEEDS TO CHANGE TO YOUR VAULT (relative to your home dir)
    target = ".obsidian-theme.css";
    text = /* css */ "

        :root {
           --color-red: ${red};
           --color-orange: ${orange};
           --color-yellow: ${yellow};
           --color-green: ${green};
           --color-cyan: ${cyan};
           --color-blue: ${blue};
           --color-purple: ${magenta};
           --color-pink: ${magenta};

           --bold-color: ${red};
           --italic-color: ${magenta};
           --text-normal: ${base05};
           --text-muted: ${base04};
           --text-selection: ${blue};
           --text-highlight-bg: ${base00};
        }

        .workspace-ribbon.side-dock-ribbon.mod-left::before {
          background-color: var(--background-secondary) !important;
        }

        .workspace-split.mod-sidedock.mod-left-split .workspace-tab-header-container {

          background-color: var(--background-secondary) !important;
        }

        .workspace-split.mod-root.mod-vertical .workspace-tab-header-container {

          background-color: var(--background-primary) !important;
        }

        .workspace-split.mod-sidedock.mod-left-split>.workspace-leaf-resize-handle {
          top: 0;
          height: 100%;
          border-color: var(--background-modifier-border);
        }

        .modal>.modal-content>.vertical-tab-header {
          background-color: var(--background-secondary) !important;
        }

        .theme-dark {
          --background-primary: ${base00};
          --background-secondary: ${base01};

          --background-modifier-cover: ${base00}CC; /*Obsidian Title Bar Bg*/
          --background-primary: ${base00}; /*Note background*/
          --background-primary-alt: ${base01}; /*Note Title background active*/
          --background-secondary: ${base01}; /*Sidebar background*/
          --background-secondary-alt: ${base00}; /*Sidebar Title background*/
          
          --background-modifier-border: ${base04}55; /*Border outline of quotes, tables, line breaks*/
          
          --text-normal: ${base05}; /*Text body of note*/
          --text-muted: ${base04}; /*Text darker for sidebar, toggles, inactive, tags, etc*/
          --text-accent: ${blue}; /*Links*/
          --text-accent-hover: ${cyan}; /*Links hover*/
          --text-faint: ${base04}; /*Link brackets color & Gutter Numbers*/

          --text-highlight-bg: ${base0E}66; /*Search Matches*/
          --text-highlight-bg-active: ${base0A}66; /*Active Search Match (Preview Mode)*/
          --text-selection: ${base0D}44; /*Text Selections*/

          --interactive-normal: ${base01}; /*Button Color*/
          --interactive-hover: ${base00}; /*Button Hovered Color*/
          --interactive-accent: ${magenta}; /*Workspace Note Title Underline*/
          --interactive-accent-hover: ${green}; /*Menu Button Hover*/
          
          --scrollbar-bg: ${base00}0D; /*Scrollbar Gutter Background*/
          --scrollbar-thumb-bg: ${base05}0D; /*Scrollbar Color*/
          --scrollbar-active-thumb-bg: ${base05}0D; /*Scrollbar Color*/

          --prompt-background: var(--background-secondary)

        }


    ";
  };
}
