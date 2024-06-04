output "private_key_pem" {
  description = "Private key data in PEM format"
  value       = tls_private_key.example.private_key_pem
  sensitive   = true
}

output "public_key_pem" {
  description = "Public key data in PEM format"
  value       = tls_private_key.example.public_key_pem
}