#Private DNS Namespace resource
resource "aws_service_discovery_private_dns_namespace" "r53_dns" {
  name        = "test.example.local"
  description = "Test hostname for vpc"
  vpc         = aws_vpc.main.id
}

#Service Discovery
resource "aws_service_discovery_service" "main" {
  name = "test"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.r53_dns.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }
}
