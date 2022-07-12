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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/amdemas/goodgrief/master/bin/goodgrief) -p gnome"
```

It is also possible to run only specific parts by using the `-t` options. For example, the following command will only run the bootstrap tasks, which will prepare the repositories and install some required packages:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/amdemas/goodgrief/master/bin/goodgrief) -p gnome -t alacritty "
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
./bin/goodgrief -h
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
      <td><a href="roles/alacritty">Alacritty</a></td>
      <td>Installs <a href="https://github.com/alacritty/alacritty">Alacritty</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/aws">AWS</a></td>
      <td>Installs <a href="https://github.com/aws/aws-cli">aws-cli</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/chromium">Chromium</a></td>
      <td>Installs <a href="https://www.chromium.org/">Chromium</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/docker">Docker</a></td>
      <td>Manages the installation of <a href="https://docker.io/">Docker</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/git">Git</a></td>
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
      <td><a href="roles/mxmaster">mxmaster</a></td>
      <td>Installs and configures <a href="https://github.com/PixlOne/logiops">logiops</a> and <a href="https://github.com/pwr-Solaar/Solaar">solaar</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/node">Node</a></td>
      <td>Installs and configures node using <a href="https://github.com/nvm-sh/nvm">NVM</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/packages">Packages</a></td>
      <td>Installs various cli tools and applications.</td>
    </tr>
    <tr>
      <td><a href="roles/python">Python</a></td>
      <td>Installs <a href="https://www.python.org/">Python</a> with Pipenv.</td>
    </tr>
    <tr>
      <td><a href="roles/ruby">Ruby</a></td>
      <td>Installs <a href="https://github.com/rbenv/rbenv">rbenv to manage ruby environments</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/rust">Rust</a></td>
      <td>Installs <a href="https://www.rust-lang.org/">rustup and cargo</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/taskwarrior">Taskwarrior</a></td>
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

## Contributing

Refer to the [contributing guide](https://github.com/amdemas/goodgrief/blob/main/CONTRIBUTING.md).

## Credits

Alot of this is pulled from other peoples work. Thanks to everyone for their creativity!

## License

This project is under the MIT License. Check [LICENSE](https://github.com/amdemas/goodgrief/blob/main/LICENSE) file to see the full text full text.
