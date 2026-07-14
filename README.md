# Lab: Migrating 1.0 → 2.0 (YAML sandbox config → HCL container resource)

A 4-page Instruqt 2.0 lab teaching one migration pattern: converting a
`containers:` entry in a 1.0 `config.yml` into a `resource "container"` block
in 2.0 HCL.

## HCL schema (matches docs.instruqt.com "Final Code")
- `main.hcl`  — `resource "lab"` with a `content { chapter { page { reference } } }` block
- `pages.hcl` — `resource "page"`; the task page attaches its check via an `activities = {}` map
- `layouts.hcl` — `resource "layout"`; instructions tab (`type = "instructions"`) + terminal tab
- `sandbox.hcl` — `resource "network"` + `resource "container"` (image block, port block, network block)
- `tabs.hcl`   — `resource "terminal"` targeting the workstation container
- `tasks.hcl`  — `resource "task"` with `config { target }` + `condition { check { script, failure_message } }`

The task page markdown (`03_convert.md`) embeds `<instruqt-task id="migrate_container">`,
whose id matches the key in the page's `activities` map — this is how the check renders on the page.

## Pages
1. `01_intro.md`    — why YAML → HCL
2. `02_anatomy.md`  — side-by-side + field-by-field mapping table
3. `03_convert.md`  — hands-on task: learner writes `/root/work/sandbox.hcl` in the Terminal tab
4. `04_validate.md` — recap + how the pattern scales

## Check
`scripts/check_migration.sh` runs in the workstation container; exit 0 = pass, non-zero = fail.
It confirms the learner's HCL has container `webserver`, image `nginx:1.25`, and port 80.
Tested against correct/incorrect/empty/un-migrated inputs.

## Sources
- 1.0 `config.yml` container format — instruqt_doc.txt (config.yml reference)
- 2.0 lab/page/layout/task/container schema — knowledgebase.txt (docs.instruqt.com getting-started "Final Code")
