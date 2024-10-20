variable "GITHUB_TOKEN" {
  description = "GitHub fine-grained access token"
  type        = string
  sensitive   = true
}

variable "VERCEL_API_TOKEN" {
  description = "Vercel API token"
  type        = string
  sensitive   = true
}
