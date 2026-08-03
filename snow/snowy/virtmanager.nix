{ ... }:

{
  xdg.desktopEntries.virt-manager = {
    name = "Virtual Machine Manager";
    genericName = "Desktop virtualization";
    comment = "Manager virtual machines";
    icon = "virt-manager";
    exec = "env -u PYTHONPATH /usr/bin/python3 /usr/bin/virt-manager %U";
    terminal = false;
    type = "Application";
    categories = [ "System" "Emulator" ];
  };
}
