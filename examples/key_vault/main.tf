module "keyvault" {
  source = "../../"


  rg_name = "test-rg"
  secrets = {
    hello = "hello"
    foo   = "bar"
  }
  user_object_id_list = ["12345-1234-1234-1234-1234567"]
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
