resource "ncloud_server" "dev-bastion-host-server" {
    name = "dev-bastion-host-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-bastion-host-key.key_name 
}


resource "ncloud_server" "dev-game-lb-server" {
    name = "dev-game-lb-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-game-lb-key.key_name 
}


resource "ncloud_server" "dev-gms-server" {
    name = "dev-gms-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-gms-key.key_name 
}


resource "ncloud_server" "dev-log-db-server" {
    name = "dev-log-db-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-log-db-key.key_name 
}


resource "ncloud_server" "dev-pay-server" {
    name = "dev-pay-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-pay-server-key.key_name 
}


resource "ncloud_server" "dev-redis-server" {
    name = "dev-redis-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-redis-server-key.key_name 
}


resource "ncloud_server" "dev-util-server" {
    name = "dev-util-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-util-server-key.key_name 
}


resource "ncloud_server" "dev-game-db-server" {
    name = "dev-game-db-server"
    subnet_no = ncloud_subnet.yggdra-dev-pub-sub.id
    server_image_product_code = "XXXXXXX"
    login_key_name = ncloud_login_key.dev-game-db-key.key_name 
}

