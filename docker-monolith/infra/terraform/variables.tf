variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default     = "europe-west1"
}
variable zone {
  description = "Zone"
  default     = "europe-west1-1"
}
variable disk_image {
  description = "Disk image"
}
variable "node_count" {
  default = "1"
}
