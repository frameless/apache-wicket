resource "github_repository" "strapi" {
  name                        = "strapi"
  description                 = null
  allow_merge_commit          = false
  allow_rebase_merge          = true
  allow_squash_merge          = true
  allow_auto_merge            = true
  delete_branch_on_merge      = true
  has_issues                  = true
  has_downloads               = true
  has_projects                = true
  has_wiki                    = false
  vulnerability_alerts        = true
  homepage_url                = "https://cms.frameless.io/"
  visibility                  = "public"
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"

  pages {
    build_type = "workflow"
    cname      = "cms.frameless.io"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "strapi-main" {
  repository_id = github_repository.strapi.node_id

  pattern                         = "main"
  enforce_admins                  = false
  allows_deletions                = false
  require_signed_commits          = false
  required_linear_history         = true
  require_conversation_resolution = true
  allows_force_pushes             = false
  lock_branch                     = false

  # Restrict merging PRs to admins

  restrict_pushes {
    blocks_creations = false
    push_allowances = [
      "${data.github_organization.frameless.orgname}/${github_team.frameless-admin.name}",
      "${data.github_organization.frameless.orgname}/${github_team.frameless-utrecht-pdc-maintainer.name}",
      "/${data.github_user.frameless-devops.username}"
    ]
  }

  required_status_checks {
    contexts = ["continuous-integration", "continuous-deployment"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
    restrict_dismissals        = false
  }
}

resource "github_repository_collaborators" "strapi" {
  repository = github_repository.strapi.name

  team {
    permission = "admin"
    team_id    = github_team.frameless-admin.slug
  }

  # Maintainers only have merging rights, not repository maintainer rights

  team {
    permission = "push"
    team_id    = github_team.frameless-utrecht-pdc-maintainer.slug
  }

  team {
    permission = "push"
    team_id    = github_team.frameless-utrecht-pdc-developer.slug
  }

  team {
    permission = "triage"
    team_id    = github_team.frameless-utrecht-pdc.slug
  }

  team {
    permission = "triage"
    team_id    = github_team.external-utrecht-pdc.slug
  }

  # Outside collaborators

  user {
    permission = "triage"
    username   = data.github_user.external-jeroen-du-chatinier.username
  }

  user {
    permission = "triage"
    username   = data.github_user.external-rene-olling.username
  }

  user {
    permission = "triage"
    username   = data.github_user.external-utrecht-devops.username
  }
}
