#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y \
  fish \
  neovim \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  net-tools \
  nmap \
  mosh \
  openssh-client \
  openssh-server \
  nim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io nodejs

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

here=$(realpath $(dirname "$0"))

mkdir -p $HOME/.config/fish
pushd $HOME/.config/fish
unlink config.fish
ln -s $here/config.fish .
popd
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish


mkdir -p $HOME/.config/nvim
pushd $HOME/.config/nvim
unlink init.vim
unlink nvim-configs
ln -s $here/init.vim .
ln -s $here/nvim-configs .
popd

ln -s $here/.tmux.conf $(realpath $HOME/.tmux.conf)
nvim '+PlugInstall' +qall

ln -s $here/.gitconfig $(realpath $HOME/.gitconfig)


