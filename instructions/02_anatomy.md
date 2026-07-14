# Anatomy of the two formats

Here is the container you're migrating. **Left is what you have (1.0). Right is where it's going (2.0).**

### 1.0 — `config.yml`

```yaml
version: "3"
containers:
- name: webserver
  image: nginx:1.25
  ports:
  - 80
```

### 2.0 — `sandbox.hcl`

```hcl
resource "container" "webserver" {
  image {
    name = "nginx:1.25"
  }
  port {
    local = 80
  }
}
```

### Field-by-field mapping

| 1.0 (`config.yml`) | 2.0 (`sandbox.hcl`) | What changed |
|---|---|---|
| list item under `containers:` | `resource "container" "..." { }` | A list entry becomes a **typed, named resource**. |
| `name: webserver` | the second label: `"webserver"` | The name becomes the resource **label**, not a field. |
| `image: nginx:1.25` | `image { name = "nginx:1.25" }` | A scalar becomes a nested **block** with a `name` attribute. |
| `ports: [80]` | `port { local = 80 }` | The list becomes one `port` block per port. |

### Why the resource *label* matters

In 1.0 the `name` was just a string. In 2.0 the label is an **address** — other resources refer to it as `resource.container.webserver`. That's how a `task`, `service`, or `network` attaches to this container. This is the single biggest mental shift in the migration: you're not writing data, you're declaring a resource other things can point at.

**Reference:** container resource syntax — docs.instruqt.com, *Sandbox Resources → Container*.

On the next page you'll write the HCL yourself.
