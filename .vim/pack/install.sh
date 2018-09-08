#!/usr/bin/env bash
# This file lives in ~/.vim/pack/install.sh
# Remember to add executable: chmod +x ~/.vim/pack/install.sh
#
# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}
# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}
(
set_group node
package https://github.com/marijnh/tern_for_vim.git &
package https://github.com/moll/vim-node.git &
wait
) &
(
set_group util
package https://github.com/SirVer/ultisnips.git &
package https://github.com/honza/vim-snippets.git &
package https://github.com/Valloric/YouCompleteMe.git &
package https://github.com/bling/vim-airline.git &
package https://github.com/vim-airline/vim-airline-themes.git &
package https://github.com/scrooloose/nerdtree.git &
package https://github.com/tomtom/tcomment_vim.git &
package https://github.com/tpope/vim-repeat.git &
package https://github.com/tpope/vim-surround.git &
package https://github.com/majutsushi/tagbar.git &
package https://github.com/Yggdroot/indentLine.git &
package https://github.com/Raimondi/delimitMate &
wait
) &
(
set_group srcctrl
package https://github.com/vim-scripts/vcscommand.vim.git &
wait
) &
(
set_group syntax
package https://github.com/vim-syntastic/syntastic.git &
package https://github.com/pangloss/vim-javascript.git &
package https://github.com/leafgarland/typescript-vim &
wait
) &
(
set_group colorschemes
package https://github.com/tomasr/molokai.git &
wait
) &
wait
