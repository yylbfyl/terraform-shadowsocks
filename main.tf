provider "alicloud" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"

}

resource "alicloud_vpc" "vpc" {
  name       = "tf_ss_aliyun"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "172.16.0.0/21"
  availability_zone = "ap-southeast-1a"
}

resource "alicloud_security_group" "default" {
  name = "default"
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_instance" "instance" {
  # cn-hongkong
  availability_zone = "ap-southeast-1a"
  security_groups = alicloud_security_group.default.*.id
  # series III
  instance_type        = "ecs.t5-lc2m1.nano"
  system_disk_category = "cloud_ssd"
  image_id             = "ubuntu_22_04_x64_20G_alibase_20220824.vhd"
  instance_name        = "temp_shadowsocks"
  vswitch_id = alicloud_vswitch.vsw.id
#  password = "${var.password}"
  user_data = "${var.user_data}"
  internet_max_bandwidth_out = 50
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}
