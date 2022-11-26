provider "alicloud" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"

}

resource "alicloud_vswitch" "default-vswitch" {
    vpc_id = "${alicloud_vpc.default-vpc.id}"
    vswitch_name = "default-vswitch"
    cidr_block = "172.21.48.0/20"
    zone_id = "ap-southeast-1a"
}

resource "alicloud_vpc" "default-vpc" {
    # vpc_id = "${alicloud_vpc.default-vpc.id}"
    vpc_name = "default-vpc"
    cidr_block = "172.16.0.0/12"
}

resource "alicloud_security_group" "default-sg" {
    name = "default-sg"
    vpc_id = "${alicloud_vpc.default-vpc.id}"
}




resource "alicloud_eci_container_group" "shadowsocks" {
  container_group_name = "tf-shadowsocks"
  cpu                  = 0.25
  memory               = 0.5
  restart_policy       = "OnFailure"
  security_group_id    = alicloud_security_group.default-sg.id
  # security_group_id    = alicloud_security_group.group.id
  # vswitch_id           = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  vswitch_id           = alicloud_vswitch.default-vswitch.id
  tags = {
    TF = "create"
  }

  containers {
    image             = "shadowsocks/shadowsocks-libev"
    name              = "shadowsocks"
    image_pull_policy = "IfNotPresent"
    ports {
      port     = 8388
      protocol = "TCP"
    }
    environment_vars {
      key   = "METHOD"
      value = "aes-256-gcm"
    }
    environment_vars {
      key   = "PASSWORD"
      value = "12345678"
    }
  }
  auto_create_eip = true
  eip_bandwidth = 30
}
