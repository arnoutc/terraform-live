output "alb_dns_name" {
  value       = module.web-server-cluster.alb_dns_name
  description = "The domain name of the load balancer"
}


output "names_smaller_than_5_chars" {
  value = [for name in var.names: upper(name) if length(name) < 5]
}

output "bios" {
value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}
