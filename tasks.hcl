resource "task" "migrate_container" {
  description = "Rewrite the legacy config.yml container as an HCL container resource in sandbox.hcl"

  config {
    target = resource.container.workstation
  }

  condition "sandbox_hcl_written" {
    description = "Rewrite the legacy config.yml container as an HCL container resource in /root/work/sandbox.hcl"

    check {
      script          = "scripts/check_migration.sh"
      failure_message = "Your sandbox.hcl doesn't match the legacy config.yml yet. Make sure you have a container resource named \"webserver\", the ubuntu:22.04 image, and port 80 exposed. See the failing line printed in the terminal."
    }
  }
}
