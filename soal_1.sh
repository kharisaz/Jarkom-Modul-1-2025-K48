#config setup eru
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.235.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.235.2.1
	netmask 255.255.255.0

#config setup melkor
auto eth0
iface eth0 inet static
	address 192.235.1.2
	netmask 255.255.255.0
	gateway 192.235.1.1

#config setup manwe
auto eth0
iface eth0 inet static
	address 192.235.1.3
	netmask 255.255.255.0
	gateway 192.235.1.1

#config setup varda
auto eth0
iface eth0 inet static
	address 192.235.2.2
	netmask 255.255.255.0
	gateway 192.235.2.1

#config setup ulmo
auto eth0
iface eth0 inet static
	address 192.235.2.3
	netmask 255.255.255.0
	gateway 192.235.2.1
