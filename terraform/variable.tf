variable "do_token" {
	default=""
}
variable "ssh_fingerprint" {
	default="a3:4a:f0:52:38:c5:ec:63:6c:76:66:71:d8:16:c9:b4"
}
variable "region" {
	default = "nyc3"
}
variable "size" {
	default = "s-1vcpu-2gb"
}
variable "pgsize" {
        default = "db-s-1vcpu-1gb"
}
variable "pgcount" {
	default = "1"
}
variable "cluster_name" {
	default="nodeapp-cluster"
}
variable "cluster_version" {
        default="1.17.5-do.0"
}
variable "cluster_minpool" {
        default="1"
}
variable "cluster_maxpool" {
        default="3"
}
variable "API_PORT" {
	default = "8080"
}
variable "WEB_PORT" {
	default = "80"
}
