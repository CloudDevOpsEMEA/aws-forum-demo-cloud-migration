# Big-IP Data
output "bigip_data" {
  value = <<EOF
    [
      "mgmt_priv_ips": ${join(",", flatten(module.bigip.mgmt_addresses))},
      "mgmt_pub_ips": ${join(",", module.bigip.mgmt_public_ips)},
      "mgmt_public_dns": ${join(",", module.bigip.mgmt_public_dns)},
      "mgmt_url": "https://${element(module.bigip.mgmt_public_dns, 0)}:8443",
      "aws_secret_name": ${aws_secretsmanager_secret.bigip.name}
    ]
    EOF
}

# WebServers
output "webservers" {
  value = <<EOF
      private_ips: ${join(", ", module.webserver.webserver_private_ips)}
      public_ips : ${join(", ", module.webserver.webserver_public_ips)}
      public_dns : ${join(", ", module.webserver.webserver_public_dns)}
    EOF
}
