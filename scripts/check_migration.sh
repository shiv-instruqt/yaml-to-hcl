#!/bin/bash
# check_migration.sh
# Validates that the learner has correctly converted the legacy 1.0 config.yml
# container definition into a 2.0 HCL container resource.
#
# Legacy config.yml being migrated:
#   version: "3"
#   containers:
#   - name: webserver
#     image: nginx:1.25
#     ports:
#     - 80
#
# Target HCL (what a correct answer contains):
#   resource "container" "webserver" {
#     image {
#       name = "nginx:1.25"
#     }
#     port {
#       local = 80
#     }
#   }
#
# The script runs inside the workstation container, so it reads the file the
# learner edits directly. It exits 0 on success and 1 on failure, printing the
# first thing that is wrong so the learner gets actionable feedback.

set -o pipefail

HCL_FILE="/root/work/sandbox.hcl"

fail() {
  echo "❌ $1"
  exit 1
}

# 1. File must exist and be non-empty.
[ -s "$HCL_FILE" ] || fail "sandbox.hcl not found or empty at $HCL_FILE"

# 2. Normalise: strip comments and collapse whitespace so formatting is forgiving.
NORM="$(sed 's/#.*//' "$HCL_FILE" | tr -s '[:space:]' ' ')"

# 3. Container resource with the right label.
echo "$NORM" | grep -Eq 'resource[[:space:]]+"container"[[:space:]]+"webserver"[[:space:]]*\{' \
  || fail 'Missing: resource "container" "webserver" { ... }'

# 4. Image block with the migrated image name.
echo "$NORM" | grep -Eq 'image[[:space:]]*\{[^}]*name[[:space:]]*=[[:space:]]*"nginx:1\.25"' \
  || fail 'Image not migrated correctly. Expect: image { name = "nginx:1.25" }'

# 5. Port 80 exposed (accept the common HCL forms).
if echo "$NORM" | grep -Eq 'port[[:space:]]*\{[^}]*local[[:space:]]*=[[:space:]]*80'; then
  :
elif echo "$NORM" | grep -Eq 'ports?[[:space:]]*=[[:space:]]*\[[^]]*\b80\b'; then
  :
else
  fail 'Port 80 not exposed. Add a port block, e.g. port { local = 80 }'
fi

echo "✅ sandbox.hcl matches the legacy config.yml. Migration complete."
exit 0
