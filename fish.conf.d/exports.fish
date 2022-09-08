# Make vim the default editor.
set -x EDITOR subl

# Enable persistent REPL history for `node`.
set -x NODE_REPL_HISTORY "~/.node_history"
# Allow 32³ entries " the default is 1000.
set -x NODE_REPL_HISTORY_SIZE "32768"
# Use sloppy mode by default, matching web browsers.
set -x NODE_REPL_MODE "sloppy"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
set -x PYTHONIOENCODING "UTF-8"

# Increase Bash history size. Allow 32³ entries " the default is 500.
set -x HISTSIZE "32768"
set -x HISTFILESIZE "$HISTSIZE"
# Omit duplicates and commands that begin with a space from history.
set -x HISTCONTROL "ignoreboth"

# Prefer US English and use UTF-8.
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

# Don’t clear the screen after quitting a manual page.
set -x MANPAGER "less -X"

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
set -x GPG_TTY (tty)

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOBIN $GOROOT/bin /Users/tobio/.cargo/bin
set -x JAVA_HOME /Users/tobio/.gradle/jdk/jdk-8u302-b08/
set -x TF_PLUGIN_CACHE_DIR $HOME/.terraform.d/plugin-cache
