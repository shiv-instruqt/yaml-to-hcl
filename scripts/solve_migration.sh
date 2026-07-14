#!/bin/bash
# Writes a correct answer, so the task can be auto-solved during testing.
set -e
cat > /root/work/sandbox.hcl <<'HCL'
resource "container" "webserver" {
  image {
    name = "nginx:1.25"
  }
  port {
    local = 80
  }
}
HCL
echo "Solved: correct sandbox.hcl written."
