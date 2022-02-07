<p align="center"><img height="250" src="/assets/goodgrief.png"></p>

<p align="center"><strong>An Ansible playbook to configure a Fedora, Ubuntu, or Arch Linux workstation</strong></p>
<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#roles">Roles</a> •
  <a href="#theming">Theming</a> •
  <a href="#contributing">Test</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>
<h1></h1>

This Ansible playbook installs and maintain all the packages and dotfiles I use in my development environment. Roles can be run over Ubuntu, Fedora, and Arch systems. I like to switch things up from time to time.

## Usage

The following command is all you need to have it ready to roll:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/amdemas/goodgrief/master/bin/goodgrief)"
```

### Applying a specific profile and/or tag

The profiles determine the DE to setup and can be applied by setting the `-p` variable before the bootstraping commands. The definition of these profiles can be found in the `host_vars` directory. If no profile is specified, the [gnome profile](host_vars/gnome.yml) will be applied. The following example shows how to use this variable:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/amdemas/goodgrief/master/bin/goodgrief) -p bspwm"
```

It is also possible to run only specifc parts by using the `-t` options. For example, the following command will only run the bootstrap tasks, which will prepare the repositories and install some required packages:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/amdemas/goodgrief/master/bin/goodgrief) -p bspwm -t alacritty "
```

### Running the playbook manually

Once the system has been bootstrapped, a copy of the repository will be placed in `${HOME}/.config/dotfiles`. To apply the playbook manually, execute the following commands:

```sh
cd ~/.config/dotfiles
git pull origin master
ansible-playbook -i inventory playbook.yml --diff [--limit PROFILE] [--tags TAGS] --ask-become-pass
```

Or run the helper script

```sh
./bin/goodgrief -u
```

### Updating

When modification are made to the playbooks, you can run the helper script to keep your system up to date. If your system is bootstrapped, then the helper script is accessible
in the path.

```sh
goodgrief -u
```

## Roles

<table>
  <thead>
    <tr>
      <th align="left" width="200">Name</th>
      <th align="left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="roles/alacritty">alacritty</a></td>
      <td>Installs <a href="https://github.com/alacritty/alacritty">Alacritty</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/aws">aws</a></td>
      <td>Installs <a href="https://github.com/aws/aws-cli">aws-cli</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/bspwm">bspwm</a></td>
      <td>Installs <a href="https://github.com/baskerville/bspwm">bspwm</a> and set up the wallpaper by using <a href="https://github.com/derf/feh">feh</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/chromium">chromium</a></td>
      <td>Installs <a href="https://www.chromium.org/">Chromium</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/docker">docker</a></td>
      <td>Manages the installation of <a href="https://docker.io/">Docker</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/dunst">dunst</a></td>
      <td>Configures system notifications to use <a href="https://github.com/dunst-project/dunst">dunst</a>. The flag <a href="chrome://flags/#enable-native-notifications">enable-native-notifications</a> is required to get native notifications with Chromium.</td>
    </tr>
    <tr>
      <td><a href="roles/git">git</a></td>
      <td>Manages the installation of <a href="https://git-scm.com/">Git</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/gnome">Gnome</a></td>
      <td>Installs and configures the <a href="https://gnome.org/">Gnome</a> Desktop Environment.</td>
    </tr>
    <tr>
      <td><a href="roles/go">Go</a></td>
      <td>Installs and configures the <a href="https://go.dev/">Go</a> Language.</td>
    </tr>
    <tr>
      <td><a href="roles/kube">Kubernetes</a></td>
      <td>Installs and configures the <a href="https://kubernetes.io/">Kubectl</a> and <a href="https://minikube.sigs.k8s.io/docs/start/">minikube</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/lightdm">lightdm</a></td>
      <td>Installs <a href="https://github.com/canonical/lightdm">lightdm</a> and the <a href="https://github.com/Antergos/web-greeter">lightdm-webkit2</a> greeter. <b>Arch Only</b></td>
    </tr>
    <tr>
      <td><a href="roles/mxmaster">mxmaster</a></td>
      <td>Installs and configures <a href="https://github.com/PixlOne/logiops">logiops</a> and <a href="https://github.com/pwr-Solaar/Solaar">solaar</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/node">node</a></td>
      <td>Installs and configures node using <a href="https://github.com/nvm-sh/nvm">NVM</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/packages">packages</a></td>
      <td>Installs various cli tools and applications.</td>
    </tr>
    <tr>
      <td><a href="roles/picom">picom</a></td>
      <td>Installs <a href="https://github.com/yshui/picom">picom</a> compositor.</td>
    </tr>
    <tr>
      <td><a href="roles/polybar">polybar</a></td>
      <td>Installs <a href="https://github.com/polybar/polybar">polybar</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/python">Python</a></td>
      <td>Installs <a href="https://www.python.org/">Python</a> with Pipenv.</td>
    </tr>
    <tr>
      <td><a href="roles/rofi">rofi</a></td>
      <td>Installs <a href="https://github.com/davatorium/rofi">rofi</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/ruby">ruby</a></td>
      <td>Installs <a href="https://github.com/rbenv/rbenv">rbenv to manage ruby environments</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/rust">Rust</a></td>
      <td>Installs <a href="https://www.rust-lang.org/">rustup and cargo</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/sxhkd">sxhkd</a></td>
      <td>Installs <a href="https://github.com/baskerville/sxhkd">sxhkd</a> and sets key bindings.</td>
    </tr>
    <tr>
      <td><a href="roles/taskwarrior">taskwarrior</a></td>
      <td>Installs <a href="https://taskwarrior.org/">taskwarrior</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/tmux">tmux</a></td>
      <td>Installs <a href="https://github.com/tmux/tmux/wiki">tmux</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/vim">vim</a></td>
      <td>Installs <a href="https://neovim.io/">Neovim</a> using <a href="https://github.com/rafi/vim-config">rafi's sweet config</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/vscode">vscode</a></td>
      <td>Installs <a href="https://code.visualstudio.com/">VSCode</a>. All settings are synced with <a href="https://code.visualstudio.com/docs/editor/settings-sync">Settings Sync</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/xorg">xorg</a></td>
      <td>Installs <a href="https://www.x.org/wiki">Xorg</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/zsh">zsh</a></td>
      <td>Installs <a href="https://www.zsh.org/">zsh</a> along with <a href="https://github.com/zplug/zplug">zplug</a>. Refer to the <a href="roles/zsh/zplug.zsh">zplug.zsh</a> for the plugins used.</td>
    </tr>
  </tbody>
</table>

## Theming

Some of the roles defined above allow to change their theme, affecting the look of the installed applications. This theme can be selected by defining an existing value for the `theme` variable:

```yaml1
theme: nord
```

## Tests

The tests utilize [molecule](https://github.com/ansible-community/molecule) with each role having their own molecule directory and a base [moclule directory](https://molecule.readthedocs.io/en/latest/examples.html#monolith-repo)

Test the entire project

```shell
$ pipenv install
$ molecule test -s {default,arch,ubuntu}
```

Test each role

```shell
$ cd role/<rolename>
$ molecule test -s {default,arch,ubuntu}
```

## Credits

Alot of this is pulled from other peoples work. Thanks to everyone for their creativity!

## Credits

This project is under the GNU General Public License v3.0. Check [LICENSE](https://github.com/amdemas/goodgrief/blob/main/LICENSE) file to see the full text full text.
