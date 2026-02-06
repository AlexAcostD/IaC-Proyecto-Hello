data "azurerm_container_app_environment" "existing_env" {
  name = "env-javier"
  resource_group_name = "rg-javierhuaman"
}
resource "azurerm_container_app" "app" {
  name                         = "${var.project_name}-app"
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = data.azurerm_container_app_environment.existing_env.id
  revision_mode                = "Single"

  template {
    min_replicas = 1

    container {
      name   = "alex"
      image  = var.container_image
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "APP_NAME"
        value = var.app_name
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8000

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}