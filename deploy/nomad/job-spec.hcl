variable "image_tag" {
  type    = string
  default = "latest"
}

job "lescinskas-website" {
  datacenters = ["dc1"]
  type = "service"
  namespace = "lescinskas-lt"

  group "web" {
    count = 2

    # Rolling deployment configuration
    update {
      max_parallel     = 1
      health_check     = "checks"
      min_healthy_time = "10s"
      healthy_deadline = "2m"
      progress_deadline = "5m"
      auto_revert      = true
      canary           = 0
    }

    network {
      mode = "bridge"
      port "http" {
        to = 80
      }
    }

    task "website" {
      driver = "docker"

      config {
        image = "ghcr.io/plutzilla/lescinskas-lt-website:${var.image_tag}"

        ports = ["http"]

        # Force pull to ensure we get the latest version
        force_pull = true

        # Set proper authentication if needed (uncomment if repository is private)
        # auth {
        #   username = "your-github-username"
        #   password = "your-github-token"
        # }
      }

      resources {
        cpu    = 100
        memory = 64
        memory_max = 256
      }

      service {
        name = "lescinskas-website"
        port = "http"
        provider = "nomad"

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "3s"
        }

        tags = [
          "website",
          "web",
          "nginx-backend",
          "hostname=lescinskas.lt",
          "hostname=www.lescinskas.lt"
        ]
      }
    }
  }
}
