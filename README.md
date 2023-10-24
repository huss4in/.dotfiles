# Dotfiles

```sh
git clone --recurse-submodules https://github.com/huss4in/.dotfiles.git ~/.dotfiles
git clone --recurse-submodules https://github.com/huss4in/.dotfiles.private.git ~/.dotfiles.private
```

---

```sh
stow --no --stow --verbose --target ~ */

stow --no --stow --verbose --target ~ bash/ neofetch/ rust/ shell/ tmux/ zsh/ AstroNvim/
```

```sh
stow -nSvt ~ */
stow -Rvt ~ */
```
