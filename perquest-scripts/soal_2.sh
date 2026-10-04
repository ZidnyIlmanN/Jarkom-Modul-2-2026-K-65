#!/bin/bash
# ==============================================================================
# PRAKTIKUM JARINGAN KOMPUTER 2026 - MODUL 2
# KELOMPOK: K-65 | PREFIX SUBNET: 10.96.x.x
# SOAL 2: WAN DHCP, IP Forwarding Kernel, dan Source NAT MASQUERADE
# ==============================================================================

# ---- NODE ROOTKIT (ROUTER SENTRAL) ----
# 1. Pastikan antarmuka WAN eth0 aktif via DHCP
dhclient eth0 2>/dev/null || udhcpc -i eth0 -n -q 2>/dev/null || true

# 2. Aktifkan IPv4 Packet Forwarding di level kernel Linux
sysctl -w net.ipv4.ip_forward=1

# 3. Terapkan aturan iptables Source NAT MASQUERADE keluar melalui eth0
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# 4. Konfigurasi persistensi pada /etc/network/interfaces di rootkit
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1
    up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

auto eth1
iface eth1 inet static
    address 10.96.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.96.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.96.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 10.96.4.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 10.96.5.1
    netmask 255.255.255.0
EOF

# ---- VERIFIKASI PADA ROUTER ROOTKIT ----
echo "=== VERIFIKASI TABEL NAT MASQUERADE DI ROOTKIT ==="
iptables -t nat -L -n -v

# ---- VERIFIKASI DARI KLIEN (CONTOH: ALPHA - 10.96.2.2) ----
# ping -c 4 8.8.8.8
# ping -c 4 google.com
