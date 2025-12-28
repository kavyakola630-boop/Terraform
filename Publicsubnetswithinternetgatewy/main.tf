resource "aws_vpc" "myvpcdev" {
  cidr_block = var.network_info.vpccidr
  tags = {
    Name = var.network_info.vpcname
  }
}
resource "aws_subnet" "publicsubnets" {
  count = local.pub_subnets_value ? length(var.network_info.pubsub_info[0].subnetcidr) : 0
  vpc_id = aws_vpc.myvpcdev.id 
  cidr_block = var.network_info.pubsub_info[0].subnetcidr[count.index]
  availability_zone = var.network_info.pubsub_info[0].subnetazs[count.index] 
  tags = {
    Name = var.network_info.pubsub_info[0].subnetnames[count.index]
  } 
  depends_on = [ aws_vpc.myvpcdev ]
} 
resource "aws_route_table" "myownroute" { 
  vpc_id = aws_vpc.myvpcdev.id 
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myownigw.id
  } 
  tags = {
    Name = "myntrroute"
  } 
  depends_on = [ aws_vpc.myvpcdev ]
} 
resource "aws_internet_gateway" "myownigw" {
  vpc_id = aws_vpc.myvpcdev.id 
  tags = {
    Name = "myigw"
  }  
  depends_on = [ aws_vpc.myvpcdev ]
} 
resource "aws_route_table_association" "mypublicroute" {
  count = local.pub_subnets_value ? length(aws_subnet.publicsubnets) : 0
  route_table_id = aws_route_table.myownroute.id 
  subnet_id = aws_subnet.publicsubnets[count.index].id 
  depends_on = [ aws_route_table.myownroute,aws_subnet.publicsubnets ]
}