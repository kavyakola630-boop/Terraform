locals {
  pub_subnets_value = length(var.network_info.pubsub_info[0].subnetazs)>0
}