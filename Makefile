arch:
	vagrant destroy -f
	env _VM_BOX=archlinux/archlinux vagrant up

ubuntu:
	vagrant destroy -f
	env _VM_BOX=ubuntu/trusty64 vagrant up

