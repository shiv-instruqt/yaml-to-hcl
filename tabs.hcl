# Terminal tab - command-line access to the workstation container
resource "terminal" "shell" {
  target = resource.container.workstation
  shell  = "/bin/bash"
}
