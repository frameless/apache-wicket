resource "github_repository" "apache-wicket" {
  name                        = "apache-wicket"
  description                 = "Apache Wicket example website based on the NL Design System architecture."
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
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  topics                      = ["nl-design-system", "apache-wicket"]

  pages {
    build_type = "workflow"
  }

  lifecycle {
    prevent_destroy = true
  }
}


resource "github_repository_ruleset" "apache-wicket-main" {
  name        = "main"
  repository  = github_repository.apache-wicket.name
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
  }

  bypass_actors {
    actor_id    = github_team.frameless-ci.id
    actor_type  = "Team"
    bypass_mode = "always"
  }
}

resource "github_repository_collaborators" "apache-wicket" {
  repository = github_repository.apache-wicket.name

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
