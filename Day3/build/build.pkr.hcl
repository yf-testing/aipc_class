source digitalocean codeserver {
    api_token = var.do_token
    image = var.do_image
    region = var.do_region
    size = var.do_size
    ssh_username = "root"
    snapshot_name = "codeserver"
}

build {
    sources = [
        "source.digitalocean.codeserver"
    ]

    provisioner ansible {
        playbook_file = "playbook.yaml"
	extra_arguments = [ "--scp-extra-args", "'-O'" ]
    }
}
