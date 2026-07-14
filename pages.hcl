resource "page" "intro" {
  title = "Why the config changed"
  file  = "instructions/01_intro.md"
}

resource "page" "anatomy" {
  title = "Anatomy of the two formats"
  file  = "instructions/02_anatomy.md"
}

resource "page" "convert" {
  title = "Convert the container by hand"
  file  = "instructions/03_convert.md"

  activities = {
    migrate_container = resource.task.migrate_container
  }
}

resource "page" "validate" {
  title = "What you learned"
  file  = "instructions/04_validate.md"
}
