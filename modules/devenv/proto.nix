{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    buf
    protoc-gen-go
    protoc-gen-go-grpc
  ];
}
