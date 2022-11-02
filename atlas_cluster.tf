resource "mongodbatlas_cluster" "cluster" {
  project_id             = var.project_id
  name                   = var.cluster_name
  mongo_db_major_version = var.mongodbversion
  cluster_type           = "REPLICASET"
  # Provider Settings "block"
  auto_scaling_disk_gb_enabled = false
  backup_enabled = false
  provider_name = "TENANT"
  backing_provider_name = "AWS"
  provider_instance_size_name  = "M0"
  provider_region_name = var.region

}
output "connection_strings" {
  value = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
}