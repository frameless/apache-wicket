resource "github_repository" "design-system" {
  name                        = "design-system"
  description                 = "Frameless Design System based on the NL Design System architecture."
  allow_merge_commit          = false
  allow_rebase_merge          = true
  allow_squash_merge          = true
  allow_auto_merge            = true
  delete_branch_on_merge      = true
  has_issues                  = true
  has_downloads               = false
  has_projects                = true
  has_wiki                    = false
  vulnerability_alerts        = true
  homepage_url                = "https://design-system.frameless.io/"
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  topics                      = ["nl-design-system", "storybook"]

  pages {
    build_type = "workflow"
  }

  template {
    include_all_branches = false
    owner                = "nl-design-system"
    repository           = "example"
  }

  lifecycle {
    prevent_destroy = true
  }
}


resource "github_repository_ruleset" "design-system-main" {
  name        = "main"
  repository  = github_repository.design-system.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["refs/heads/main"]
      exclude = []
    }
  }

  rules {
    pull_request {
      dismiss_stale_reviews_on_push     = true
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }
    required_linear_history = true

    required_status_checks {
      required_check {
        context = "build"
      }
      required_check {
        context = "install"
      }
      required_check {
        context = "lint"
      }
      required_check {
        context = "test"
      }
    }
  }

  bypass_actors {
    actor_id    = github_team.frameless-ci.id
    actor_type  = "Team"
    bypass_mode = "always"
  }
}

resource "github_repository_collaborators" "design-system" {
  repository = github_repository.design-system.name

  team {
    permission = "admin"
    team_id    = github_team.frameless-admin.slug
  }

  # Maintainers only have merging rights, not repository maintainer rights

  team {
    permission = "push"
    team_id    = github_team.frameless-everyone.slug
  }
}

resource "vercel_project" "design-system" {
  name             = github_repository.design-system.name
  output_directory = "packages/storybook/dist/"
  ignore_command   = "[[ $(git log -1 --pretty=%an) == 'dependabot[bot]' ]]"

  git_repository = {
    type = "github"
    repo = "${data.github_organization.frameless.orgname}/${github_repository.design-system.name}",
  }

  vercel_authentication = {
    deployment_type = "none"
  }
}
