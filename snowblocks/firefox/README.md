# Firefox (Developer Edition)

This snowblock for [Firefox][] Quantum and [Firefox Developer Edition][firefox-dev-edition] provides…

* …the [`user.js`][mzkb-user.js] file to define and persist almost all preferences for a profile.
* …the [`profiles.ini`][mzkb-profiles.ini] file to configure the name and path of the main profile `igloo`.
* …the `ignore-dev-edition-profile` file (placed within the Firefox application data folder) to fix [Bugzilla bug 1098986][bugzilla-1098986] that causes Firefox Developer Edition to use the internal default profile regardless of whether another customized profile has been set as default.
* …the `chrome` folder with the [`userChrome.css`][mzkb-userchrome.css] and [`userContent.css`][mzkb-usercontent.css] files to customize the Firefox UI components design and layout and elements of websites.
* …the `containers.json` file of the [Firefox Multi-Account Containers][firefox-addon-multi-acc-cont] to persist the configured containers.

## Configurations

### Typeface

Due to licensing and the availability of specific font families on different operating systems the preferences for the default sans-serif and serif typefaces must be configured manually using the Firefox UI (_Preferences_ → _General_ → _Language and Appearance_ → _Fonts & Colors_ → <kdb>Advanced…</kdb>) or by setting the following keys to the desired font family names:

```js
/* Linux */
user_pref("font.name.sans-serif.x-western", "<FONT FAMILY>"); // e.g. "Roboto"
user_pref("font.name.serif.x-western", "<FONT FAMILY>"); // e.g. "Noto Serif"

/* macOS (default font families) */
user_pref("font.name.sans-serif.x-western", "Helvetica");
user_pref("font.name.serif.x-western", "Times");
```

The default font for the monospace typeface is system independent and has already been set in the [`user.js`][gh-igloo-sb-ff-user.js] to [Source Code Pro][google-font-source-code-pro]:

```js
user_pref("font.name.monospace.x-western", "Source Code Pro");
```

## Troubleshooting

### Ignore the default Firefox Developer Edition profile

Due to a [bug in Firefox Developer Edition][bugzilla-1098986] only the default profile will be used regardless of whether another customized profile has been set as default. The problem has been fixed by creating a [`ignore-dev-edition-profile`][gh-igloo-sb-ff-ignore-dev-profile] file within the Firefox application data folder:

```sh
# Linux
touch ~/.mozilla/firefox/ignore-dev-edition-profile

# macOS
touch ~/Library/Application\ Support/Firefox/ignore-dev-edition-profile
```

## References

* [ghacksuserjs/ghacks-user.js][] - An ongoing comprehensive user.js template for configuring and hardening Firefox privacy, security and anti-fingerprinting.
* [pyllyukko/user.js][] - Firefox `user.js` configuration file for Mozilla Firefox designed to harden browser settings and make it more secure.

[bugzilla-1098986]: https://bugzilla.mozilla.org/show_bug.cgi?id=1098986
[firefox]: https://www.mozilla.org/en-US/firefox
[firefox-addon-multi-acc-cont]: https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
[firefox-dev-edition]: https://www.mozilla.org/en-US/firefox/developer
[ghacksuserjs/ghacks-user.js]: https://github.com/ghacksuserjs/ghacks-user.js
[gh-igloo-sb-ff-ignore-dev-profile]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/firefox/ignore-dev-edition-profile
[gh-igloo-sb-ff-user.js]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/firefox/user.js
[google-font-source-code-pro]: https://fonts.google.com/specimen/Source+Code+Pro
[mzkb-profiles.ini]: http://kb.mozillazine.org/Profiles.ini_file
[mzkb-user.js]: http://kb.mozillazine.org/User.js_file
[mzkb-userchrome.css]: http://kb.mozillazine.org/index.php?title=UserChrome.css
[mzkb-usercontent.css]: http://kb.mozillazine.org/index.php?title=UserContent.css
[pyllyukko/user.js]: https://github.com/pyllyukko/user.js
