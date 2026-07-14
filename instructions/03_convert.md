# Convert the container by hand

Time to do the migration yourself, using the **Terminal** tab.

### Your task

Recreate the container from the legacy `config.yml` (shown on the previous page) as an HCL `container` resource in a new file, **`/root/work/sandbox.hcl`**.

Your `sandbox.hcl` must define a container that matches the legacy file:

1. A resource of type `container` with the label **`webserver`**.
2. An `image` block whose `name` is **`nginx:1.25`**.
3. Port **`80`** exposed.

### Steps

In the Terminal tab, create the working directory and open the file:

```bash
mkdir -p /root/work
nano /root/work/sandbox.hcl
```

This is the shape you're aiming for (fill it in from the mapping table on the previous page):

```hcl
resource "container" "webserver" {
  image {
    name = "..."
  }
  port {
    local = ...
  }
}
```

Save with `Ctrl+X`, then `Y`, then `Enter`.

### Check your work

Press **Check** below. The check reads your `sandbox.hcl`, ignores comments and spacing, and confirms the container name, image, and port all match the legacy config. If something's off, it prints the exact line that failed so you can fix it and re-check.

> Tip: formatting is forgiving — `image { name = "nginx:1.25" }` on one line passes just as well as the multi-line form. What matters is the container label, the image name, and port 80.

**Reference:** container + port syntax — docs.instruqt.com, *Sandbox Resources → Container*.

<instruqt-task id="migrate_container"></instruqt-task>
