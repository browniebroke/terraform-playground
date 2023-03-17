data "http" "ssh_keys" {
  url = var.ssh_pubkey_url
}

resource "aws_key_pair" "production" {
  key_name   = "${var.ecs_cluster_name}_key_pair"
  public_key = split("\n", tostring(data.http.ssh_keys.response_body))[0]
}
