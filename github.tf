terraform {
  cloud {
    organization = "frameless"

    workspaces {
      name = "terraform"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }

    vercel = {
      source  = "vercel/vercel"
      version = "1.14.1"
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
  token = var.GITHUB_TOKEN
}


provider "vercel" {
  team      = "frameless"
  api_token = var.VERCEL_API_TOKEN
}
