network_info = {
  vpcname = "myadvpc-dev" 
  vpccidr = "10.0.0.0/16" 
  pubsub_info = [ {
    subnetazs = ["ap-south-1a","ap-south-1b"] 
    subnetcidr = ["10.0.1.0/24","10.0.2.0/24"] 
    subnetnames = ["web-dev","app-dev"]
  } ]
}