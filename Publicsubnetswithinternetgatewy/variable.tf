variable "network_info" {
  description = "this is network in dev env" 
  type = object({
    vpccidr = string 
    vpcname = string 
    pubsub_info = list(object({
      subnetcidr = list(string) 
      subnetnames = list(string) 
      subnetazs = list(string)
    }))
  }) 
}