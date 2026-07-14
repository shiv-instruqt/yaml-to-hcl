# Why the config changed

In **Instruqt 1.0**, everything about your sandbox lived in a single `config.yml` file written in YAML. Containers, VMs, and cloud resources were all entries in flat lists. It was quick to read, but it had limits: no typing, no references between resources, and no way to validate a file before you shipped a track.

**Instruqt 2.0** replaces that YAML with **HCL** (the same configuration language as Terraform). Instead of list items, each thing in your sandbox is a typed **resource** you can name and reference elsewhere. The sandbox definition moves out of `config.yml` and into files like `sandbox.hcl`.

> **The one migration pattern this lab teaches:**
> a `containers:` entry in `config.yml` → a `resource "container"` block in `sandbox.hcl`.

You'll do it by hand on a real example, then a check will confirm your conversion is correct.

**References**
- 1.0 sandbox config: `config.yml` container format — Instruqt docs (config.yml reference)
- 2.0 sandbox resources: `resource "container"` — docs.instruqt.com, *Sandbox Resources → Compute → Container*

Open the **Terminal** tab — you'll create your migrated file there. The legacy source you're converting from is shown on the next page.

When you're ready, go to the next page.
