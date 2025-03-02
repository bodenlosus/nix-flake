{ config, pkgs, ... }:
{
  # Enable virtualization services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        package = pkgs.qemu_kvm.override {
          openGLSupport = true;
          virglSupport = true;
        };
        runAsRoot = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMFFull.override {
              secureBoot = true;
              tpmSupport = true;
            })
          ];
        };
      };
    };

    spiceUSBRedirection.enable = true;
  };

  # Install required packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
  ];

  # Enable dconf (needed for virt-manager settings)
  programs.dconf.enable = true;

  # Enable critical services
  services = {
    spice-vdagentd.enable = true;
  };

  # Add user to required groups
  users.users."${config.var.username}" = {
    extraGroups = [ "libvirtd" "kvm" "qemu-libvirtd" ];
  };

  # IOMMU and virtualization CPU flags
  boot.kernelParams = [ 
    # Uncomment the appropriate line for your CPU
    # "intel_iommu=on"  # For Intel CPUs
    "amd_iommu=on"    # For AMD CPUs
    "iommu=pt"
  ];
  boot.kernelModules = [
    "kvm-amd" # Use "kvm-amd" for AMD CPUs
    "vfio"
    "vfio_pci"
    "vfio_virqfd"
    "vfio_iommu_type1"
    
  ];
}

