# Taskwarrior

> Taskwarrior is a flexible, fast, and unobtrusive CLI tool to manage your TODOs that does its job and gets out of your way.

## Extensions

### taskopen

The [taskopen][] extension allows to take notes and open URLs with attached to Taskwarrior tasks.

Next to the `task` binary itself, this Perl script depends on the `JSON` module which can be installed on Arch Linux via the [perl-json][arch-perl-json] package.

## Troubleshooting

### taskopen workaround for macOS

The management of installed [Perl modules][cpan-doc-modules] on macOS is not as simple and well thought through like with package managers on Linux systems, e.g. via [pacman][archw-pacman] on [Arch Linux][archlinux]. There are problems when is comes to configuring the runtime path the modules have been installed to even when using the most popular module manager called [cpanminus][].
This causes the [Taskwarrior][] plugin [taskopen][] fail to load because the Perl core module `JSON` can't be found and loaded.

As a workaround a custom script can be implemented to create and open an attached task note:

1. Use the [`_get`][tw-doc-api-_get] function of the [Taskwarrior DOM API][tw-doc-dom-api] to extract any stored piece of information of an task. This allows to receive the [UUID of an task][tw-doc-ids].
2. Create a custom `on` (open note) [Taskwarrior alias][tw-doc-alias] to run the implemented custom script via the `execute` command.

The logic of the script follows the same like taskopen uses for default notes:

* Use the [UUID of an task][tw-doc-ids] as the note filename.
* Simply pass the file to an editor (in this case [Atom][]) which will…
  * …create a new file if it doesn't exist yet.
  * …open the file if it already exists.

Note that **this script is not limited to macOS** but can also be used for any other Linux host!

[archlinux]: https://archlinux.org
[arch-perl-json]: https://www.archlinux.org/packages/community/any/perl-json
[archw-pacman]: https://wiki.archlinux.org/index.php/Pacman
[atom]: https://atom.io
[cpanminus]: https://github.com/miyagawa/cpanminus
[cpan-doc-modules]: http://www.cpan.org/modules
[taskopen]: https://github.com/ValiValpas/taskopen
[taskwarrior]: https://taskwarrior.org
[tw-doc-alias]: https://taskwarrior.org/docs/terminology.html#alias
[tw-doc-api-_get]: https://taskwarrior.org/docs/commands/_get.html
[tw-doc-dom-api]: https://taskwarrior.org/docs/dom.html
[tw-doc-ids]: https://taskwarrior.org/docs/ids.html
