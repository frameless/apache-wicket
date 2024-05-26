resource "github_team_members" "frameless-admin" {
  team_id = github_team.frameless-admin.id

  members {
    username = data.github_user.yolijn.username
    role     = "admin"
  }

  members {
    username = data.github_user.robbert.username
    role     = "admin"
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
  }

  members {
    username = data.github_user.yolijn.username
  }
}

resource "github_team_members" "frameless-iso27001" {
  team_id = github_team.frameless-iso27001.id

  members {
    username = data.github_user.angela-imhof.username
  }

  members {
    username = data.github_user.robbert.username
  }

  members {
    username = data.github_user.yolijn.username
  }
}
