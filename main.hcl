resource "lab" "main" {
  title       = "Migrating from 1.0 to 2.0: YAML Sandbox Config to HCL Container Resource"
  description = "Take a real Instruqt 1.0 config.yml and rebuild it as a 2.0 sandbox.hcl. You'll learn how the flat YAML container list maps onto typed HCL resources, then prove it with a validated task."

  layout = resource.layout.single_column

  content {
    chapter "migration" {
      title = "1.0 to 2.0 Migration"

      page "intro" {
        reference = resource.page.intro
      }

      page "anatomy" {
        reference = resource.page.anatomy
      }

      page "convert" {
        reference = resource.page.convert
      }

      page "validate" {
        reference = resource.page.validate
      }
    }
  }
}
