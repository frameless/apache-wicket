resource "github_team" "frameless-everyone" {
  name        = "everyone"
  description = "Everyone in Frameless"
  privacy     = "closed"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_team" "frameless-admin" {
  name        = "admin"
  description = "Aministrators of Frameless"
  privacy     = "closed"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_team" "frameless-iso27001" {
  name        = "iso27001"
  description = "ISO 27001 contributors in Frameless"
  privacy     = "closed"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_team" "frameless-terraform" {
  name        = "terraform"
  description = "Terraform contributors in Frameless"
  privacy     = "closed"
}

resource "github_team" "frameless-utrecht-pdc" {
  name           = "frameless-utrecht-pdc"
  parent_team_id = github_team.frameless-everyone.id
  description    = "Frameless team for Gemeente Utrecht PDC project"
  privacy        = "closed"
}

resource "github_team" "frameless-utrecht-pdc-developer" {
  name           = "frameless-utrecht-pdc-developer"
  parent_team_id = github_team.frameless-utrecht-pdc.id
  description    = "Frameless developers for Gemeente Utrecht PDC project"
  privacy        = "closed"
}

resource "github_team" "frameless-utrecht-pdc-maintainer" {
  name           = "frameless-utrecht-pdc-maintainer"
  parent_team_id = github_team.frameless-utrecht-pdc-developer.id
  description    = "Frameless maintainers for Gemeente Utrecht PDC project"
  privacy        = "closed"
}

resource "github_team" "external-utrecht" {
  name        = "external-utrecht"
  description = "Gemeente Utrecht"
  privacy     = "closed"
}

resource "github_team" "external-utrecht-pdc" {
  name           = "external-utrecht-pdc"
  parent_team_id = github_team.external-utrecht.id
  description    = "Gemeente Utrecht - contributors to the PDC project"
  privacy        = "closed"
}
