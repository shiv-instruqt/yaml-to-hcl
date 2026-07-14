#!/bin/bash
# Runs once when the sandbox starts. Plants the legacy file + starter file
# in the directory the learner works in.
set -e
mkdir -p /root/work
cp /root/lab/files/legacy_config.yml /root/work/config.yml
cp /root/lab/files/starter_sandbox.hcl /root/work/sandbox.hcl
echo "Workstation ready. Legacy config.yml and starter sandbox.hcl are in /root/work."
