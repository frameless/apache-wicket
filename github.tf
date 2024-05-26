terraform {
  cloud {
    organization = "frameless"

    workspaces {
      name = "github"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

data "github_organization" "frameless" {
  name = "frameless"
}

# Configure the GitHub Provider
provider "github" {
  # Token will be obtained from the environment variable `GITHUB_TOKEN`
  owner = "frameless"
}
