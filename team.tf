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
  name        = "admin"
  description = "ISO 27001 contributors in Frameless"
  privacy     = "closed"

  lifecycle {
    prevent_destroy = true
  }
}
