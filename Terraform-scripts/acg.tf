# Bastion Host
resource "ncloud_access_control_group" "yggdra-dev-acg-bastion-host" {
    name = "yggdra-dev-acg-bastion-host"
    description = "yggdra-acg-bastion-host"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-bastion-host-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-bastion-host

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "22"
        description = "ssh access"
    }

    outbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "1-65535"
        description = "all outbound"
    }  
}

# Game Load Balancer

resource "ncloud_access_control_group" "yggdra-dev-acg-game-lb" {
    name = "yggdra-dev-acg-game-lb"
    description = "yggdra-acg-game-lb"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-game-lb-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-game-lb

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "80"
        description = "http access"
    }

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "443"
        description = "https access"
    }

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "7307"
        description = "game access"
    }

    outbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "1-65535"
        description = "all outbound"
    }
}


# Pay Load Balancer

resource "ncloud_access_control_group" "yggdra-dev-acg-pay-server" {
    name = "yggdra-dev-acg-pay-server"
    description = "yggdra-acg-pay-server"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-pay-server-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-pay-server

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "80"
        description = "http access"
    }

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "443"
        description = "https access"
    }

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "7307"
        description = "game access"
    }

    outbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "1-65535"
        description = "all outbound"
    }
}


# Util Server

resource "ncloud_access_control_group" "yggdra-dev-acg-util-server" {
    name = "yggdra-dev-acg-util-server"
    description = "yggdra-acg-util-server"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-util-server-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-util-server

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-game-lb.id
        port_range = "8007"
        description = "LB access port 8007"
    }

    outbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "1-65535"
        description = "all outbound"
    }
}

# GMS Server

resource "ncloud_access_control_group" "yggdra-dev-acg-gms-server" {
    name = "yggdra-dev-acg-gms-server"
    description = "yggdra-acg-gms-server"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}
  
resource "ncloud_access_control_group_rule" "yggdra-dev-acg-gms-server-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-gms-server

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "8000"
        description = "GM access GMS port 8000"
    }

    inbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "3000"
        description = "GM access GMS port 3000"
    }

    outbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-redis-server.id
        port_range = "6379"
        description = "GMS access redis port 6379"
    }

    outbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-log-db-server.id
        port_range = "27017"
        description = "GMS access log db port 27017"
    }
}



# Redis Server

resource "ncloud_access_control_group" "yggdra-dev-acg-redis-server" {
    name = "yggdra-dev-acg-redis-server"
    description = "yggdra-acg-redis-server"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-redis-server-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-redis-server

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-pay-server.id
        port_range = "6379"
        description = "pay server access port 6379"
    }

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-util-server.id
        port_range = "6379"
        description = "util server access port 6379"
    }

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-gms-server.id
        port_range = "6379"
        description = "gms server access port 6379"
    }

    outbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "1-65535"
        description = "all outbound"
    }
}


# Log DB Server

resource "ncloud_access_control_group" "yggdra-dev-acg-log-db-server" {
    name = "yggdra-dev-acg-log-db-server"
    description = "yggdra-acg-log-db-server"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-log-db-server-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-log-db-server

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-acg-game-lb.id
        port_range = "27017"
        description = "LB access port 27017"
    }

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-util-server.id
        port_range = "27017"
        description = "util server access port 27017"
    }

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-gms-server.id
        port_range = "27017"
        description = "gms server access port 27017"
    }
}

# DB Server

resource "ncloud_access_control_group" "yggdra-dev-acg-db-server" {
    name = "yggdra-dev-acg-db-server"
    description = "yggdra-acg-db-server"
    vpc_no = ncloud_vpc.yggdra-dev-vpc.id
}

resource "ncloud_access_control_group_rule" "yggdra-dev-acg-db-server-rule" {
    access_control_group_no = ncloud_access_control_group.yggdra-dev-acg-db-server

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-game-lb.id
        port_range = "27017"
        description = "LB access port 27017"
    }

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-util-server.id
        port_range = "27017"
        description = "util server access port 27017"
    }

    inbound = {
        protocol = "TCP"
        ip_block = ncloud_access_control_group.yggdra-dev-acg-gms-server.id
        port_range = "27017"
        description = "gms server access port 27017"
    }

    outbound = {
        protocol = "TCP"
        ip_block = "0.0.0.0/0"
        port_range = "1-65535"
        description = "all outbound"
    }
}

