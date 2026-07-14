resource "layout" "single_column" {
  column {
    width = "45"

    instructions {}
  }

  column {
    width = "55"

    tab "terminal" {
      target = resource.terminal.shell
      title  = "Terminal"
      active = true
    }
  }
}
