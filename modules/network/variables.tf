variable "cidr_block" {
  type        = string
  description = "CIDR usado na VPC"
}
variable "project_name" {
  type        = string
  description = "Nome do projeto para tagueamento dos recursos"

}

variable "tags" {
  type        = map(string)
  description = "Tags para os recursos"
  default     = {}
}