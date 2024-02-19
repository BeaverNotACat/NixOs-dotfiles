{
  networking.wireless.networks."Keenetic-1995" = {
    psk="64dGQX8t";
  };
  networking.wireless.networks."Beavers hotspot" = {
    psk="kap0086d";
  };
  networking.wireless.networks."BeaversWiFi" = {
    psk="kap0086d";
  };
  networking.wireless.networks."Nyatspot" = {
    psk="meowmeownyam17";
  };
  
  networking.wireless.networks."my_rooter_5G" = {
    psk="Zuza2804";
  };

  networking.wireless.networks."DVFU-STUDENTS" = {
  auth = ''
    key_mgmt=WPA-EAP
    eap=PEAP
    scan_ssid=1
    phase1="peaplabel=0"
    phase2="auth=MSCHAPV2"
    identity="gubanov.ima"
    password="Kap=0086~D"
    '';
  };

}
