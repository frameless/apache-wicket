resource "github_team_members" "frameless-admin" {
  team_id = github_team.frameless-admin.id

  members {
    username = data.github_user.yolijn.username
    role     = "maintainer"
  }

  members {
    username = data.github_user.robbert.username
    role     = "maintainer"
  }

  members {
    username = data.github_user.frameless-devops.username
    role     = "maintainer"
  }
}

resource "github_team_members" "frameless-everyone" {
  team_id = github_team.frameless-everyone.id

  members {
    username = data.github_user.ali-kadhim.username
  }

  members {
    username = data.github_user.ali-kadhim.username
  }

  members {
    username = data.github_user.angela-imhof.username

  }

  members {
    username = data.github_user.bryan-de-jong.username
  }

  members {
    username = data.github_user.frameless-devops.username
    role     = "maintainer"
  }

  members {
    username = data.github_user.marwa-hello.username
  }

  members {
    username = data.github_user.mees-post.username
  }

  members {
    username = data.github_user.savi-sepulveda-martinez.username
  }

  members {
    username = data.github_user.rowan-van-laar.username
  }

  members {
    username = data.github_user.tessa-viergever.username
  }

  members {
    username = data.github_user.robbert.username
    role     = "maintainer"
  }

  members {
    username = data.github_user.yolijn.username
    role     = "maintainer"
  }
}

resource "github_team_members" "frameless-terraform" {
  team_id = github_team.frameless-terraform.id

  members {
    username = data.github_user.bryan-de-jong.username
  }

  members {
    username = data.github_user.ali-kadhim.username
  }
}

resource "github_team_members" "frameless-iso27001" {
  team_id = github_team.frameless-iso27001.id

  members {
    username = data.github_user.angela-imhof.username
  }

  members {
    username = data.github_user.robbert.username
    role     = "maintainer"
  }

  members {
    username = data.github_user.yolijn.username
    role     = "maintainer"
  }
}

resource "github_team_members" "frameless-utrecht-pdc" {
  team_id = github_team.frameless-utrecht-pdc.id

  members {
    username = data.github_user.angela-imhof.username
  }
}

resource "github_team_members" "frameless-utrecht-pdc-developer" {
  team_id = github_team.frameless-utrecht-pdc-developer.id

  members {
    username = data.github_user.bryan-de-jong.username
  }

  members {
    username = data.github_user.mees-post.username
  }

  members {
    username = data.github_user.rowan-van-laar.username
  }

  members {
    username = data.github_user.savi-sepulveda-martinez.username
  }
}

resource "github_team_members" "frameless-utrecht-pdc-maintainer" {
  team_id = github_team.frameless-utrecht-pdc-maintainer.id

  members {
    username = data.github_user.ali-kadhim.username
  }
}
