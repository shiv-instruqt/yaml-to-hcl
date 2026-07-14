# The sandbox this lab runs in is itself authored in 2.0 HCL.
resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "container" "workstation" {
  image {
    name = "ubuntu:22.04"
  }

  network {
    id = resource.network.main.meta.id
  }
}
