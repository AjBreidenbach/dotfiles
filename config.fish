fish_vi_key_bindings
set -gx PATH ~/bin $PATH
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/build/node-v14.15.0-linux-x64/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.gem/bin $PATH
set -gx PATH $HOME/.pyenv/bin $PATH
set -gx PATH $HOME/build/zig-linux-x86_64-0.9.0-dev.749+259f3458a $PATH
set -gx LAWCLICK "/home/andrew/projects/lawclick"
set -gx JAVA_HOME "/usr/lib/jvm/java-1.16.0-openjdk-amd64/"
set -gx ANDROID_SDK_ROOT "$HOME/build/android-sdk"
set -gx ANDROID_HOME "$HOME/build/android-sdk"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx PATH $HOME/.nimble/bin $PATH

set -gx PATH $ANDROID_SDK_ROOT/cmdline-tools/tools/bin $PATH
set -gx LD_LIBRARY_PATH "/usr/local/lib"

set -gx RUST_SRC_PATH "/home/andrew/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/"

function fishedit
	nvim $HOME/.config/fish/config.fish
	source $HOME/.config/fish/config.fish
end


abbr android_em "$ANDROID_SDK_ROOT/emulator/emulator"
abbr adb "$ANDROID_SDK_ROOT/platform-tools/adb"
abbr mv "mv -i"
abbr cp "cp -i"


function nv
  nohup neovide $argv &
  disown (ps | grep neovide | sed -r 's/^\s+([0-9]+).*$/\1/')
end

function ng
  set tmp "/tmp/"(head -c 5 < /dev/random | base32)
  nimgrep --colorTheme:gnu --color:always --group $argv | sed -re 's|([\x1b-\x6d]{8})'(realpath (pwd))'/|\1|g' > $tmp
  if test (wc -l $tmp | awk 'END {print $1}') -gt 25
    env LESS="-R" less -f $tmp
  else if test -f $tmp
    cat $tmp
  end

  rm $tmp
end

function ngi
  ng -i $argv
end

function ngr
  ng -r $argv
end


function ngir
  ng -ir $argv
end


function copy_pat
  xclip -i -selection clipboard < $HOME/sambashare/pat
end


function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# ~/.config/fish/functions/nvm_find_nvmrc.fish
function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

# ~/.config/fish/functions/load_nvm.fish
function load_nvm
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install (cat $nvmrc_path)
    else if test nvmrc_node_version != node_version
      nvm use $nvmrc_node_version
    end
  else if test "$node_version" != "$default_node_version"
    echo "Reverting to default Node version"
    nvm use default
  end
end

# ~/.config/fish/config.fish
# You must call it on initialization or listening to directory switching won't work


#set -gx R_LAWCLICK "/home/andrew/files/lawclick/resources"
#set -gx PATH /snap/bin $PATH
#set -gx PATH $HOME/.nimble/bin $PATH
#set -gx PATH $HOME/.cargo/bin $PATH
#set -gx PATH $HOME/.opam/system/bin $PATH
#set -gx PATH "$HOME/.pub-cache/bin" $PATH
#set -gx PATH "$HOME/scala-2.13.1/bin" $PATH
#set -gx PATH "$HOME/sbt/bin" $PATH
#set -gx PATH "/root/.sdkman/candidates/kotlin/1.3.61/bin" $PATH
#set -gx PATH "/root/.nvm/versions/node/v14.7.0/bin" $PATH
#set -gx PATH /usr/lib/dart/bin $PATH

#set -gx phantom_rasterize "/home/andrew/build/phantomjs-2.1.1-linux-x86_64/examples/rasterize.js"
#set -g tehu 172.103.0.47



