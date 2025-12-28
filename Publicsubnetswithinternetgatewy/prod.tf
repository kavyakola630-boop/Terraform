network_info = {
  vpcname = "myadvpc-prod" 
  vpccidr = "172.16.0.0/16" 
  pubsub_info = [ {
    subnetazs = ["ap-south-1a","ap-south-1b"] 
    subnetcidr = ["172.16.1.0/24","172.16.2.0/24"] 
    subnetnames = ["web-prod","app-prod"]
  } ]
}