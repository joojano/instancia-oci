terraform {
  backend "http" {
    address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/F2PPbzB8A61qzIHRhmOFkaCaNhDee8K9OmHCh7u0u1hRQCJFqkSctL-WWEZKUsNu/n/grfrb4wva5zg/b/terraform-bucket/o/terraform.tfstate"
    update_method = "PUT"
  }
}

variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "region" {
}

variable "private_key" {
}

provider "oci" {
    tenancy_ocid     = var.tenancy_ocid
    user_ocid        = var.user_ocid
    fingerprint      = var.fingerprint
    private_key      = var.private_key
    region           = var.region
}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		is_live_migration_preferred = "true"
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "tJil:SA-SAOPAULO-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaappgufk7p6rh3m6nartt2wajmmlsl4kudupriaxliwfzrjwp2wwwq"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaa22sn2t72t25mlcgohbka3ru3mgooeky5xglwjtu46ra3mtfsvwcq"
	}
	display_name = "self-hosted"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCysF/KFZmcUdhvmwwVCibjoNTCske1hsQpBNHsO491kWjyDoydNEYUYjDyJ0EUoYqdaFVFYakGAgQJAe7yUth4wprzQaMdzsIK46rAjhvl0E9fRT/gEXLEfH8lmwAT4B40yCxc+bXdx6r70Wf0+lvDzR9uxUtBESIGEWmeY+jpMhxzZfyhJ/bWwTFSUEDsVdkpVDex5yFSpzw1zq85iIWUenmF+F57QmKOXdpFEOU9jnlRbWDnZVHIvHBM+wtWV8d4J2IZXSwwh5mPUlU81g6Hu1dgwobok/J2TN21GhfRAL3Zf3gOoUnbe6S0kAB34QWLZ3qcgu8rMatOuA4YbsTJ ssh-key-2023-10-25"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaen5tmigeuccvhcon6saps4aty3l3yh4fhipwyys2q2o2jecl25ya"
		source_type = "image"
	}
}