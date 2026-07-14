# What you learned

You migrated a container from Instruqt 1.0 YAML to 2.0 HCL — the most common single step in moving a track to the new platform.

### The pattern, one more time

- A **`containers:` list item** in `config.yml` becomes a **`resource "container" "<name>"`** block in `sandbox.hcl`.
- The container's **`name`** becomes the resource **label** — an address other resources can reference as `resource.container.<name>`.
- **Scalars become blocks**: `image: nginx:1.25` → `image { name = "nginx:1.25" }`.
- **Lists become repeated blocks**: each port gets its own `port { local = ... }`.

### How this scales to a real track

The same three moves cover most of a sandbox migration:
- **VMs**: `virtualmachines:` list items → `resource "vm" "<name>"` blocks.
- **Networking**: implicit in 1.0 → an explicit `resource "network"` you reference from each container.
- **References over strings**: anywhere 1.0 repeated a name as text, 2.0 uses `resource.<type>.<name>` so the CLI can validate the wiring before you deploy.

### Next steps

- Run `instruqt lab validate` on a real 2.0 lab to catch broken references before shipping.
- Convert the rest of a `config.yml` (VMs, cloud accounts) using the same list-item-to-resource rule.

**References**
- Sandbox resources overview — docs.instruqt.com, *Sandbox Resources → Overview*
- Testing & validation — docs.instruqt.com, *Getting Started → Testing & Deployment*

Nice work — that's the core 1.0 → 2.0 migration concept.
