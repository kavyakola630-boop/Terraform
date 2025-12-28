network_info = {
  vpcname = "myadvpc-qa" 
  vpccidr = "192.168.0.0/16" 
  pubsub_info = [ {
    subnetazs = ["ap-south-1c","ap-south-1a"] 
    subnetcidr = ["192.168.1.0/24","192.168.2.0/24"] 
    subnetnames = ["web-qa","app-qa"]
  } ]
}