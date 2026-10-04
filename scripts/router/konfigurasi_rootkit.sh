#!/bin/sh
# ==============================================================================
# Inisialisasi Otomatis Router rootkit (Modul 2 - Kelompok K-65)
# ==============================================================================

echo "[*] Mengaktifkan interface LAN..."
ip link set eth1 up
ip link set eth2 up
ip link set eth3 up
ip link set eth4 up
ip link set eth5 up

echo "[*] Menetapkan IP Static pada interface LAN..."
ip addr add 10.96.1.1/24 dev eth1 2>/dev/null || true
ip addr add 10.96.2.1/24 dev eth2 2>/dev/null || true
ip addr add 10.96.3.1/24 dev eth3 2>/dev/null || true
ip addr add 10.96.4.1/24 dev eth4 2>/dev/null || true
ip addr add 10.96.5.1/24 dev eth5 2>/dev/null || true

echo "[*] Mengaktifkan WAN eth0 DHCP..."
dhclient eth0 2>/dev/null || udhcpc -i eth0 -n -q 2>/dev/null || true

echo "[*] Mengaktifkan IP Forwarding..."
sysctl -w net.ipv4.ip_forward=1

echo "[*] Mengatur iptables NAT MASQUERADE..."
iptables -t nat -C POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "[+] Konfigurasi Router rootkit selesai."
