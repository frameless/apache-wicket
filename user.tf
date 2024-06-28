# Internal users

data "github_user" "ali-kadhim" {
  username = "AliKdhim87"
}

data "github_user" "angela-imhof" {
  username = "Angelaimhof"
}

data "github_user" "bryan-de-jong" {
  username = "bddjong"
}

data "github_user" "frameless-devops" {
  username = "frameless-devops"
}

data "github_user" "mees-post" {
  username = "MeesoPost"
}

data "github_user" "savi-sepulveda-martinez" {
  username = "savitris"
}

data "github_user" "rowan-van-laar" {
  username = "scar055"
}

data "github_user" "robbert" {
  username = "Robbert"
}

data "github_user" "yolijn" {
  username = "Yolijn"
}

# External users
# For clarity, it is important to start all IDs with "external-"

data "github_user" "external-jeroen-du-chatinier" {
  username = "JeroenduC"
}

data "github_user" "external-rene-olling" {
  username = "Ollie-nl"
}

data "github_user" "external-utrecht-devops" {
  # Utrecht DevOps uses this user to download Docker images
  username = "supportvcg"
}
