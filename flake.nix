{
  description = "Flake by lazzy07";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        predator5000 = lib.nixosSystem {
          system = "x86_64-linux";
	  modules = [ 
	    ./configuration.nix
            
	    home-manager.nixosModules.home-manager
	    {
	      home-manager = {
                useGlobalPkgs = true; 
	        useUserPackages = true;
	        backupFileExtension = "backup";
	        users.lazzy07 = import ./home.nix;
	      };
            }
            
	    ./modules/network/bluetooth.nix
	    ./modules/network/ssh.nix
	    ./modules/network/tailscale.nix

	    ./modules/users/lazzy07.nix
	    
	    ./modules/shells/zsh.nix
	    
	    ./modules/window_compositors/hyprland.nix
	    
	    ./modules/system/gc.nix
	  ];
	};
      };
    };
}
