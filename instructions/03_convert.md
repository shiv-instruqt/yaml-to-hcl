# Convert the container by hand

Time to do the migration yourself, using the **Terminal** tab.

### Your task

Recreate the container from the legacy `config.yml` (shown on the previous page) as an HCL `container` resource in a new file, **`/root/work/sandbox.hcl`**.

Your `sandbox.hcl` must define a container that matches the legacy file:

1. A resource of type `container` with the label **`webserver`**.
2. An `image` block whose `name` is **`nginx:1.25`**.
3. Port **`80`** exposed.

### (Optional) Install a text editor

This workstation is a minimal image, so `nano` and `vim` are not installed by default. To use one, install both with:

```bash
apt-get update && apt-get install -y nano vim
```

This needs the container to have internet access. If it fails, use the paste method below — it works without any editor.

### Create the file

Paste this skeleton into the **Terminal**, then fill in the two blanks (`____`) using the mapping from the previous page:

```bash
mkdir -p /root/work
cat > /root/work/sandbox.hcl <<'HCL'
resource "container" "webserver" {
  image {
    name = "____"      # the image from config.yml
  }
  port {
    local = ____       # the port from config.yml
  }
}
HCL
```

Check what you wrote:

```bash
cat /root/work/sandbox.hcl
```

If a blank is still there, re-run the block above with the real value filled in (or edit the file with `nano`/`vim` if you installed one).

### Check your work

Press **Check** below. The check reads your `sandbox.hcl`, ignores comments and spacing, and confirms the container name, image, and port all match the legacy config. If something's off, it prints the exact line that failed so you can fix it and re-check.

> Tip: formatting is forgiving — `image { name = "nginx:1.25" }` on one line passes just as well as the multi-line form. What matters is the container label, the image name, and port 80.

**Reference:** container + port syntax — docs.instruqt.com, *Sandbox Resources → Container*.

<instruqt-task id="migrate_container"></instruqt-task>
