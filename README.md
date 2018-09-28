#  YouTrack plugin  #

CLI support for YouTrack interaction

##  Usage  ##

This plugin supplies one command, `yt`, through which all its features are exposed.

```
yt            # performs the default action

yt new        # opens a new issue
yt assigned [username]  # queries for issues assigned to a user
yt ABC-123    # opens an existing issue
```

##  Setup  ##

The URL for your YouTrack instance is set by `$YOUTRACK_URL` or a `.youtrack_url` file.

Add a `.youtrack-url` file in the base of your project. You can also set `$YOUTRACK_URL` in your `~/.zshrc` or put a `.youtrack-url` in your home directory. A `.youtrack-url` in the current directory takes precedence, so you can make per-project customizations.

For example:

```
echo "https://youtrack.jetbrains.com" >> ~/.youtrack-url
```

###  Variables  ###

* `$YOUTRACK_URL` - Your YouTrack instance's URL
* `$YOUTRACK_DEFAULT_ACTION` - Action to do when `yt` is called with no arguments; defaults to "new"

### Browser ###

Your default web browser, as determined by how `open_command` handles `http://` URLs, is used for interacting with the YouTrack instance. If you change your system's URL handler associations, it will change the browser that `yt` uses.
