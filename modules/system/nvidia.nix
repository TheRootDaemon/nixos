{config, ...}: {
  # nvidia driver fro Xorg and wayland
  services.xserver.videoDrivers = ["amdgpu" "nvidia"];

  # enable hardware accelerated graphics including 32-bit support,
  # for applications that use 32-bit graphics libraries
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # nvidia specific driver settings
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      # use GPU by default and offload
      # rendering to the nvidia GPU for demanding applications
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # PCI bus IDs used to identify integrated and dedicated GPUs
      amdgpuBusId = "PCI:5@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
}
