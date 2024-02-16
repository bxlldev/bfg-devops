resource "ncloud_vpc" "yggdra-dev-vpc" {
    name = "yggdra-dev-vpc"
    cidr_block = "10.0.0.0/16"
    zone = "SNG-4"
}

resource "ncloud_subnet" "yggdra-dev-pub-sub" {
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
    zone = "SNG-4"
    name = "yggdra-dev-pub-sub"
    cidr_block = "10.0.1.0/24"
    network_acl_no = ncloud_network_acl.yggdra-dev-acl.id
    subnet_type = "PUBLIC"
}

resource "ncloud_subnet" "yggdra-dev-pri-sub" {
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
    zone = "SNG-4"
    name = "yggdra-dev-pri-sub"
    cidr_block = "10.0.2.0/24"
    network_acl_no = ncloud_network_acl.yggdra-dev-acl.id
    subnet_type = "PRIVATE"
}


resource "ncloud_route_table" "yggdra-dev-pub-rt" {
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
    supported_subnet_type = ["PUBLIC"]
    name = "yggdra-dev-pub-rt"
}

resource "ncloud_route_table_assosiation" "yggdra-dev-pub-rt-asso" {
    route_table_no = ncloud_route_table.yggdra-dev-pub-rt.id
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
}


resource "ncloud_route_table" "yggdra-dev-priv-rt" {
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
    supported_subnet_type = ["PRIVATE"]
    name = "yggdra-dev-priv-rt"
}

resource "ncloud_route_table_assosiation" "yggdra-dev-priv-rt-asso" {
    route_table_no = ncloud_route_table.yggdra-dev-priv-rt.id
    subnet_no = ncloud_subnet.yggdra-dev-pri-sub.id  
}







