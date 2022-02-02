import os
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    assert host.file(os.path.join(
        host.environment().get('HOME'), 'nvim')).exists


@pytest.mark.parametrize("name", [
    "nvim",
    "vim",
    "tidy"
])
def test_packages_exists(host, name):
    """test_packages_exists

    Confirm a selection of packages are installed
    """
    assert host.package(name).is_installed
