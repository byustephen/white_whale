module "roles" {
  source            = "../modules/dev"

  #setting this as a variable so we don't repeat ourselves
  group_path = "/ancient-beasts/"
}
