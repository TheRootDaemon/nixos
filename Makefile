.PHONY: build
build:
	sudo nixos-rebuild build

.PHONY: switch
switch:
	sudo nixos-rebuild switch

.PHONY: test
test:
	sudo nixos-rebuild test --flake $(FLAKE)#$(HOST)

.PHONY: update
update:
	nix flake update

.PHONY: upgrade
upgrade: update switch

.PHONY: check
check:
	nix flake check

.PHONY: clean
clean:
	sudo nix-collect-garbage --delete-old

.PHONY: fmt
fmt:
	alejandra .
