terraform {
  required_providers {
    prismacloud = {
      source = "PaloAltoNetworks/prismacloud"
      version = "1.5.0"
    }
  }
}

provider "prismacloud" {
  # Configuration options
  url = api2.prismacloud.io
  username = a05ac833-dd4d-4f39-851e-4c22d4615e94
  password = GOeyZmpaX2DwhJVwKUI6Z6uy2TE=
}

resource "prismacloud_policy" "schwab-test5" {
  name        = "schwab-test5"
  policy_type = "config"
  cloud_type  = "gcp"
  severity    = "high"
  labels      = ["test"]
  description = "this describes the policy"
  rule {
    name = "schwab-test5"
    rule_type = "Config"
    parameters = {
      savedSearch = false
      withIac     = true
    }
    children {
      type           = "build"
      recommendation = "fix it"
      metadata = {
        "code" : file("folder/build_policy.yaml"),
      }
    }
  }
} 
