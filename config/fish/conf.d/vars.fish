set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_STATE_HOME $HOME/.local/state
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg GNUPGHOME $XDG_DATA_HOME/gnupg
set -xg WINEPREFIX $HOME/.local/share/wine/
set -xg CARGO_HOME $HOME/.local/share/cargo
set -xg RUSTUP_HOME $HOME/.local/share/rustup
set -xg RUSTC_WRAPPER sccache
set -xg PATH /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin $HOME/.local/bin $HOME/.local/share/cargo/bin
