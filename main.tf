resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
}

resource "aws_kms_key" "kms" {
  description = "kafka kms key"
}

# MSK Cluster
resource "aws_msk_cluster" "cluster" {
  cluster_name           = var.name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  storage_mode           = var.storage_mode

  broker_node_group_info {
    instance_type  = var.instance_type
    client_subnets = var.vpc_subnet_ids

    connectivity_info {
      public_access {
        type = var.public_access
      }
    }

    storage_info {
      ebs_storage_info {
        volume_size = var.instance_volume_size
      }
    }
    security_groups = [aws_security_group.sg.id]
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
  }

  client_authentication {
    sasl {
      iam = true
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }
}
