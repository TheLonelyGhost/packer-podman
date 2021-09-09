build {
  sources = ["vagrant.main"]

  provisioner "shell" {
    inline = [
      "yum update -y",
      "yum install podman",
    ]
    # scripts = [
    #   "${path.root}/packer-scripts/fedora-upgrade.sh",
    #   # "${path.root}/packer-scripts/podman-install.sh",
    #   "${path.root}/packer-scripts/cleanup.sh",
    # ]
    execute_command = "chmod +x {{ .Path }}; sudo env {{ .Vars }} sh -c {{ .Path }}"
  }

  provisioner "shell" {
    inline = [
      "systemctl --user enable --now podman.socket",
    ]
    # scripts = [
    #   "${path.root}/packer-scripts/user-setup.sh",
    # ]
  }

  # provisioner "shell" {
  #   scripts = [
  #     "${path.root}/packer-scripts/slirp4netns-upgrade.sh",
  #   ]
  #   execute_command = "chmod +x {{ .Path }}; sudo env {{ .Vars }} sh -c {{ .Path }}"
  # }
}
