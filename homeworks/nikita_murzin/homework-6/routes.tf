resource "aws_service_discovery_private_dns_namespace" "dns" {
  name        = var.app_domain
  description = "Domain for my services"
  vpc         = aws_vpc.main.id
}

resource "aws_service_discovery_service" "main" {
  name = "test-service"
  dns_config {
    namespace_id   = aws_service_discovery_private_dns_namespace.dns.id
    routing_policy = "MULTIVALUE"

    dns_records {
      ttl  = 10
      type = "A"
    }
  }

  health_check_custom_config {
    failure_threshold = 5
  }

  depends_on = [aws_service_discovery_private_dns_namespace.dns]
}