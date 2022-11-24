variable "access_key" {
  description = "access_key"
  type        = string
  default     = "AK"
}

variable "secret_key" {
  description = "secret_key"
  type        = string
  default     = "SK"
}

variable "region" {
  description = "region"
  type        = string
  default     = "ap-southeast-1"
}


variable "user_data" {
  description = "init install softwares"
  type        = string
  default     = "IyEvYmluL2Jhc2gKYXB0IHVwZGF0ZSAteSAmJiBhcHQgaW5zdGFsbCBkb2NrZXIuaW8gZG9ja2VyLWNvbXBvc2UgZ2l0IC15Cgpjb250ZW50PScnJwpzaGFkb3dzb2NrczoKICBpbWFnZTogc2hhZG93c29ja3Mvc2hhZG93c29ja3MtbGliZXYKICBwb3J0czoKICAgIC0gIjIwMjI6ODM4OCIKICBlbnZpcm9ubWVudDoKICAgIC0gTUVUSE9EPWFlcy0yNTYtZ2NtCiAgICAtIFBBU1NXT1JEPTEyMzQ1Njc4CiAgcmVzdGFydDogYWx3YXlzCicnJwoKZWNobyAiJGNvbnRlbnQiID4gZG9ja2VyLWNvbXBvc2UueW1sCi91c3IvYmluL2RvY2tlci1jb21wb3NlICB1cCAtZAo="
}
