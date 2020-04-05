/*
 * Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
 * Copyright (C) 2016-present Sven Greb <development@svengreb.de>
 *
 * Project:    igloo
 * Repository: https://github.com/arcticicestudio/igloo
 * License:    MIT
 */

/**
 * @file Defines and persist almost all preferences for a profile.
 *
 * @see http://kb.mozillazine.org/User.js_file
 * @see http://kb.mozillazine.org/About:config
 * @see https://github.com/ghacksuserjs/ghacks-user.js
 * @see https://github.com/pyllyukko/user.js
 */

/*
 * Always use the cursor to navigate within pages.
 * Available within the UI under:
 *   Preferences > General > Browsing
 */
user_pref("accessibility.browsewithcaret", false);

/*
 * Search for text when you start typing.
 * Available within the UI under:
 *   Preferences > General > Browsing
 */
user_pref("accessibility.typeaheadfind", false);

/*
 * Improve the performance and unblock e10s by disabling unused accessability features.
 * References:
 *   - https://wiki.mozilla.org/Electrolysis/Accessibility
 *   - https://wiki.mozilla.org/Electrolysis
 */
user_pref("accessibility.force_disabled", 1);

/*
 * Disallow Firefox to install and run studies.
 * Available within the UI under:
 *   Preferences > General > Privacy & Security > Firefox Data Collection and Use
 */
user_pref("app.shield.optoutstudies.enabled", false);

/* Disable third-party API requests on new tab page for snippets widget. */
user_pref("browser.aboutHomeSnippets.updateUrl", "");

/*
 * Always keep the bookmark menu open until it gets dismissed.
 * By default, the bookmarks menu will close when opening a bookmark in a new tab.
 */
user_pref("browser.bookmarks.openInTabClosesMenu", false);

/* Disable restoration of the default bookmarks for new sessions. */
user_pref("browser.bookmarks.restore_default_bookmarks", false);


user_pref("browser.contentblocking.category", false);

/*
 * Disallow Firefox to send backlogged crash reports.
 * Available within the UI under:
 *   Privacy & Security > Firefox Data Collection and Use
 */
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/*
 * Disable cyling through tabs in recently used order when using "Ctrl" + "Tab" keys.
 * Available within the UI under:
 *   Preferences > General > Tabs
 */
user_pref("browser.ctrlTab.previews", false);

/* Ensure the default background color is white. */
user_pref("browser.display.background_color", "#FFFFFF");

/*
 * Allow pages to choose their own fonts, instead of the selections defined by the user in the preferences.
 * Available within the UI under:
 *   Preferences > General > Language and Appearance > Advanced
 */
user_pref("browser.display.use_document_fonts", 1);

/* Automatically hide the download button on empty state. */
user_pref("browser.download.autohideButton", true);

/*
 * Always use the specified default download directory.
 * Available within the UI under:
 *   Preferences > General > Files and Applications > Downloads
 */
user_pref("browser.download.useDownloadDir", true);

/*
 * Open links in tabs instead of new windows.
 * Available within the UI under:
 *   Preferences > General > Tabs
 */
user_pref("browser.link.open_newwindow", 3);

/*
 * Use a minimal new tab page by disabling all additional elements except the seach bar.
 * Also improves the privacy by removing requests against third-party APIs.
 * Available within the UI under:
 *   Home > Firefox Home Content
 */
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.migrationExpired", true);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.showSearch", true);
user_pref("browser.newtabpage.activity-stream.topSitesRows", 1);
user_pref("browser.newtabpage.directory.source", "");
user_pref("browser.newtabpage.enabled", true);

/*
 * Use recommended performance settings.
 * Available within the UI under:
 *   Preferences > General > Performance
 */
user_pref("browser.preferences.defaultPerformanceSettings.enabled", true);

/*
 * Block dangerous and deceptive content.
 * Available within the UI under:
 *   Privacy & Security > Security > Deceptive Content and Dagerous Software Protection
 */
user_pref("browser.safebrowsing.downloads.enabled", true);
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", true);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", true);
user_pref("browser.safebrowsing.malware.enabled", true);
user_pref("browser.safebrowsing.phishing.enabled", true);

/*
 * Always open tabs in the background when searching for selected text.
 * By default, selecting text and searching for it with the context menu will switch to the tab.
 */
user_pref("browser.search.context.loadInBackground", true);

/*
 * Use "Google" as default search engine.
 * References:
 *   - https://support.mozilla.org/en-US/kb/change-your-default-search-settings-firefox#w_default-search-engine
 */
user_pref("browser.search.defaultenginename", "Google");
user_pref("browser.search.defaultenginename.US", "data:text/plain,browser.search.defaultenginename.US=Google");

/*
 * Enable search suggestions.
 * Available within the UI under:
 *   Search > Default Search Engine
 */
user_pref("browser.search.suggest.enabled", true);

/*
 * Automatically update search engines.
 * Available within the UI under:
 *   Preferences > General > Firefox Updates
 */
user_pref("browser.search.update", true);

/*
 * Do not load pinned and hidden tabs on launch until selected.
 * References:
 *   - https://support.mozilla.org/en-US/questions/1016880
 *   - https://support.mozilla.org/en-US/kb/access-hidden-tabs-firefox
 */
user_pref("browser.sessionstore.restore_hidden_tabs", false);
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand", true);

/*
 * Disable checking if Firefox is the default browser on startup.
 * Available within the UI under:
 *   Preferences > General > Startup
 */
user_pref("browser.shell.checkDefaultBrowser", false);

/*
 * Enable spell check while typing.
 * Available within the UI under:
 *   Preferences > General > Language
 */
user_pref("layout.spellcheckDefault", 1);

/*
 * Set the start page to Firefox's home.
 * Available within the UI under:
 *   Home > New Windows and Tabs
 */
user_pref("browser.startup.homepage", "about:home");

/*
 * Always restore the previous session.
 * Available within the UI under:
 *   Preferences > General > Startup
 */
user_pref("browser.startup.page", 3);

/* Disable automatic sending of reports on crash. */
user_pref("browser.tabs.crashReporting.sendReport", false);

/* Render tabs in the title bar. */
user_pref("browser.tabs.drawInTitlebar", true);

/*
 * Always open bookmark tabs in the background.
 * By default, middle-clicking on (or using "Open in new tab" from within the context menu) a bookmark switches to the tab.
 */
user_pref("browser.tabs.loadBookmarksInBackground", true);

/*
 * Always open bookmarks in a new tab in the background.
 * By default, opening a bookmark from the sidebar uses the current active tab.
 */
user_pref("browser.tabs.loadBookmarksInTabs", true);

/*
 * When you open a link in a new tab, switch to it immediately
 * Available within the UI under:
 *   Preferences > General > Tabs
 */
user_pref("browser.tabs.loadInBackground", true);

/*
 * Set the enabled elements/widgets and their layout in the overflow menu and navigation bar.
 * Available within the UI under:
 *   Customize...
 */
user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[\"_react-devtools-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action\",\"_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action\",\"jid1-om7ejgwa1u8akg_jetpack-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"home-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"_testpilot-containers-browser-action\",\"simple-tab-groups_drive4ik-browser-action\",\"jid1-f3mymbcpz2azyl_jetpack-browser-action\",\"fxa-toolbar-menu-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\",\"ublock0_raymondhill_net-browser-action\",\"_react-devtools-browser-action\",\"jid1-f3mymbcpz2azyl_jetpack-browser-action\",\"webide-button\",\"_testpilot-containers-browser-action\",\"snoozetabs_mozilla_com-browser-action\",\"_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action\",\"firefoxcolor_mozilla_com-browser-action\",\"jid1-om7ejgwa1u8akg_jetpack-browser-action\",\"simple-tab-groups_drive4ik-browser-action\",\"_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action\"],\"dirtyAreaCache\":[\"PersonalToolbar\",\"nav-bar\",\"toolbar-menubar\",\"TabsToolbar\",\"widget-overflow-fixed-list\"],\"currentVersion\":16,\"newElementCount\":11}");

/*
 * Set the UI density to "Normal".
 * Available within the UI under:
 *   Customize... > Density
 */
user_pref("browser.uidensity", 0);

/* Single mouse click selects the full URL. */
user_pref("browser.urlbar.clickSelectsAll", true);

/* Double mouse click selects parts of the URL. */
user_pref("browser.urlbar.doubleClickSelectsAll", false);

/* Don't show history or search suggestions entries in the URL bar. */
user_pref("browser.urlbar.matchBuckets", "");

/* Show search suggestions in the URL bar. */
user_pref("browser.urlbar.searchSuggestionsChoice", true);

/*
 * When using the URL/address bar, suggest...
 * Available within the UI under:
 *   Preferences > Privacy & Security > Address Bar
 */
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.history", true);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", true);

/* Remember zoom state per site. */
user_pref("browser.zoom.siteSpecific", true);

/*
 * Disable Firefox health reports that sends technical and interaction data to Mozilla.
 * Allow Firefox 
 * Available within the UI under:
 *   Preferences > Privacy & Security > Firefox Data Collection and Use
 */
user_pref("datareporting.healthreport.uploadEnabled", false);

/*
 * Configure the Firefox Developer Tools.
 * References:
 *   - https://developer.mozilla.org/son/docs/Tools
 */
user_pref("devtools.aboutdebugging.collapsibilities.processes", true);
user_pref("devtools.aboutdebugging.collapsibilities.tab", true);
user_pref("devtools.aboutdebugging.local-tab-debugging", true);
user_pref("devtools.aboutdebugging.showHiddenAddons", true);
user_pref("devtools.cache.disabled", false);
user_pref("devtools.command-button-frames.enabled", true);
user_pref("devtools.command-button-measure.enabled", true);
user_pref("devtools.command-button-noautohide.enabled", true);
user_pref("devtools.command-button-paintflashing.enabled", true);
user_pref("devtools.command-button-pick.enabled", true);
user_pref("devtools.command-button-responsive.enabled", true);
user_pref("devtools.command-button-rulers.enabled", true);
user_pref("devtools.command-button-screenshot.enabled", true);
user_pref("devtools.debugger.ignore-caught-exceptions", true);
/* Prevent automatic execution pause when opening DevTools on any site that contains erroneous scripts. */
user_pref("devtools.debugger.pause-on-exceptions", false);
user_pref("devtools.defaultColorUnit", "authored");
user_pref("devtools.editor.autoclosebrackets", true);
user_pref("devtools.editor.detectindentation", true);
user_pref("devtools.editor.expandtab", true);
user_pref("devtools.editor.keymap", "default");
user_pref("devtools.editor.tabsize", 2);
user_pref("devtools.gridinspector.showGridLineNumbers", true);
user_pref("devtools.responsive.reloadConditions.touchSimulation", false);
user_pref("devtools.responsive.reloadConditions.userAgent", false);
user_pref("devtools.responsive.showUserAgentInput", false);
user_pref("devtools.inspector.showUserAgentStyles", true);
user_pref("devtools.markup.collapseAttributes", true);
user_pref("devtools.memory.enabled", true);
user_pref("devtools.netmonitor.enabled", true);
user_pref("devtools.netmonitor.filters", "[\"all\"]");
user_pref("devtools.netmonitor.persistlog", false);
user_pref("devtools.performance.enabled", true);
user_pref("devtools.performance.ui.enable-framerate", true);
user_pref("devtools.performance.ui.flatten-tree-recursion", true);
user_pref("devtools.performance.ui.invert-call-tree", true);
user_pref("devtools.screenshot.audio.enabled", true);
user_pref("devtools.source-map.client-service.enabled", true);
user_pref("devtools.storage.enabled", true);
user_pref("devtools.styleeditor.autocompletion-enabled", true);
user_pref("devtools.styleeditor.enabled", true);
user_pref("devtools.styleeditor.showMediaSidebar", true);
user_pref("devtools.theme", "light");
user_pref("devtools.toolbox.host", "bottom");
user_pref("devtools.toolbox.splitconsoleEnabled", false);
user_pref("devtools.toolbox.tabsOrder", "inspector,@react-devtools,webconsole,netmonitor,styleeditor,storage,jsdebugger,performance,memory");
user_pref("devtools.webconsole.filter.debug", true);
user_pref("devtools.webconsole.filter.error", true);
user_pref("devtools.webconsole.filter.info", true);
user_pref("devtools.webconsole.filter.log", true);
user_pref("devtools.webconsole.filter.warn", true);
user_pref("devtools.webconsole.persistlog", false);
user_pref("devtools.webconsole.timestampMessages", true);
user_pref("devtools.webextensions.@react-devtools.enabled", true);

/* Enable the protection to warn if information have not been submitted yet in a tab that is tried to be closed. */
user_pref("dom.disable_beforeunload", true);

/*
 * Block pop-up- windows.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Permissions
 */
user_pref("dom.disable_open_during_load", true);

/* Set the active theme extension. */
user_pref("extensions.activeThemeID", "firefox-compact-light@mozilla.org");

/* Configure activation status of the Firefox builtin extensions. */
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.screenshots.disabled", false);

/* Enable partial search matching and highlight all matches. */
user_pref("findbar.entireword", false);
user_pref("findbar.highlightAll", false);

/* Set the system independent typefaces. */
user_pref("font.default.x-western", "sans-serif");
user_pref("font.name.monospace.x-western", "Source Code Pro");
user_pref("font.name.sans-serif.x-western", "Inter");
user_pref("font.size.fixed.x-western", 16);

/* Disable the fullscreen warning popup. */
user_pref("full-screen-api.warning.timeout", 0);

/*
 * Enable autoscrolling.
 * Available within the UI under:
 *   Preferences > General > Browsing
 */
user_pref("general.autoScroll", false);

/*
 * Enable smooth-scrolling.
 * Available within the UI under:
 *   Preferences > General > Browsing
 */
user_pref("general.smoothScroll", true);

/* Disable the warning when opening "about:config". */
user_pref("general.warnOnAboutConfig", false);

/* Disable Firefox Sync Accounts. */
user_pref("identity.fxaccounts.enabled", false);

/* Set the supported UI and spellcheck languages. */
user_pref("intl.accept_languages", "en-us,en,de");

/* Ensure that double clicking on a word will only select the word and not any space (if any) to the right of the word. */
user_pref("layout.word_select.eat_space_to_next_word", false);

/* Allow websites to change the color of the scrollbar and it's track. */
user_pref("layout.css.scrollbar-colors.enabled", true);

/* Set and configure the compact lightweight theme. */
user_pref("lightweightThemes.persisted.footerURL", false);
user_pref("lightweightThemes.persisted.headerURL", false);
user_pref("lightweightThemes.selectedThemeID", "firefox-compact-light@mozilla.org");

/*
 * Enable rhe "Encrypted Media Extensions" (EME) JavaScript API for playing DRMed video content in HTML.
 * Available within the UI under:
 *   Preferences > General > Files and Applications > Digital Right Management (DRM) Content
 *
 * References:
 *   - https://wiki.mozilla.org/Media/EME
 */
user_pref("media.eme.enabled", true);

/*
 * Accept cookies and site data from websites and keep until they expire.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Cookies and Site Data
 */
user_pref("network.cookie.cookieBehavior", 0);
user_pref("network.cookie.lifetimePolicy", 0);

/*
 * Use default system proxy settings.
 * Available within the UI under:
 *   Preferences > General > Network Proxy > Settings
 */
user_pref("network.proxy.type", 5);

/*
 * Configure categories to be cleared on private data deletion.
 * Available within the UI under:
 *   Preferences > Privacy & Security > History
 */
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.cookies", true);
user_pref("privacy.cpd.downloads", true);
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.sessions", true);
user_pref("privacy.cpd.siteSettings", true);
user_pref("privacy.cpd.offlineApps", true);

/*
 * Send websites a "Do Not Track" signal.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Tracking Protection
 */
user_pref("privacy.donottrackheader.enabled", true);

/*
 * Remember the history.
 * Available within the UI under:
 *   Preferences > Privacy & Security > History
 */
user_pref("privacy.history.custom", false);

/*
 * Use Tracking Protection to block known trackers.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Tracking Protection
 */
user_pref("privacy.trackingprotection.enabled", true);

/*
 * Configure the time span on private data deletion.
 * Available within the UI under:
 *   Preferences > Privacy & Security > History
 */
user_pref("privacy.sanitize.pending", "[]");
user_pref("privacy.sanitize.timeSpan", 0);

/*
 * Enable Container Tabs.
 * Available within the UI under:
 *   Preferences > General > Tabs
 */
user_pref("privacy.userContext.enabled", true);

/*
 * Disable the builtin reader mode extension.
 * Also configures the typeface and color theme when enabled again.
 */
user_pref("reader.color_scheme", "light");
user_pref("reader.content_width", 6);
user_pref("reader.line_height", 4);
user_pref("reader.font_size", 8);
user_pref("reader.font_type", "sans-serif");
user_pref("reader.parse-on-load.enabled", false);

/*
 * Always ask for permission when a server requests personal certificates.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Security > Certificates
 */
user_pref("security.default_personal_cert", "Ask Every Time");

/*
 * Query PCSP responder servers to confirm the current validity of certificates.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Security > Certificates
 */
user_pref("security.OCSP.enabled", 1);


/* Allows to toggle "soft tokens" to develop and test WebAuthn. */
user_pref("security.webauth.webauthn_enable_softtoken", false);
user_pref("security.webauth.webauthn_enable_usbtoken", false);

/*
 * Disable the password generation suggestion for password fields.
 * References:
 *   - https://wiki.mozilla.org/Toolkit:Password_Manager/Password_Generation
 *   - https://www.mozilla.org/firefox/lockwise
 *   - https://blog.mozilla.org/firefox/password-security-features
 */
user_pref("signon.generation.enabled", false);

/*
 * Always ask to save logins and passwords for websites.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Forms & Passwords
 */
user_pref("signon.rememberSignons", true);

/*
 * As of Firefox version 69, the ` userChrome.css` and `userContent.css` files are not loaded by default anymore
 * in order to improve the performance during browser startup.
 * To achieve the previous behavior, this option enables the loading of such "legacy" files again.
 * References:
 *   - https://www.userchrome.org/firefox-changes-userchrome-css.html
 *   - https://www.mozilla.org/en-US/firefox/69.0/releasenotes/#note-788117
 */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

/* Set the available values for zoom levels in percent. */
user_pref("toolkit.zoomManager.zoomValues", ".1,.2,.3,.4,.5,.6,.7,.8,.9,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5");

/* Disable showing the menu bar when clicking the "Alt" key. */
user_pref("ui.key.menuAccessKeyFocuses", true);

/*
 * Use default tracking protection/block lists.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Tracking Protection
 */
user_pref("urlclassifier.trackingTable", "test-track-simple,base-track-digest256");

/*
 * Always warn when websites try to install extensions/addons.
 * Available within the UI under:
 *   Preferences > Privacy & Security > Permissions
 */
user_pref("xpinstall.whitelist.required", true);

/*
 * Set keyboard mappings for "uBlock Origin" extension to enable the element picker and zapper.
 * NOTE: The keys are set for Linux OS, but also working on macOS where instead of using the "Ctrl" the "Command" (⌘)
 * key must be used!
 *
 * References:
 *   - https://github.com/gorhill/uBlock
 *   - https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
 */
user_pref("xtensions.ublock0.shortcuts.launch-element-picker", "alt-shift-Z");
user_pref("xtensions.ublock0.shortcuts.launch-element-zapper", "alt-Z");

/* 
 * Set the maximum and minimal zoom levels.
 * See "toolkit.zoomManager.zoomValues" preference for available zoom values.
 */
user_pref("zoom.maxPercent", 500);
user_pref("zoom.minPercent", 10);
