output "Jenkins_server_url" {
    value = join ("", ["http://", aws_instance.first_instance.public_ip, ":", "8080"])
    description = "Jenkins server is first_instance"
}

output "Tomcat_server_url" {
    value = join ("", ["http://", aws_instance.second_instance.public_ip, ":", "8080"])
    description = "Tomcat server is second_instance"
}