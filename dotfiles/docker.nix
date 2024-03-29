{ config, pkgs, user, ... }:
{
  virtualisation = {
    docker.enable = true;
  };
  
  users.groups.docker.members = [ "beaver" ];
  
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    docker-buildx
  ];
}
