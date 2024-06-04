variable "key_name" {
  description = "The name for the key pair"
  type        = string
}

variable "create_private_key" {
  description = "Whether to create a private key"
  type        = bool
  default     = true
}

variable "private_key_path" {
  description = "The path to save the private key"
  type        = string
}

variable "public_key_path" {
  description = "The path to save the public key"
  type        = string
}
