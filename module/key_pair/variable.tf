variable "key_name" {
  description = "The name for the key pair"
  type        = string
}

variable "public_key" {
  type        = string
  default     = null
}

variable "create_private_key" {
  type        = bool
  default     = true
}

variable "private_key_path" {
  type        = string
}

variable "public_key_path" {
  type        = string
}
