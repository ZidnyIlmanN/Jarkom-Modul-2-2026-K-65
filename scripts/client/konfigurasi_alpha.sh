#!/bin/sh
# ==============================================================================
# Inisialisasi Otomatis Node: alpha (Subnet 2 - 10.96.2.0/24)
# ==============================================================================

ip link set eth0 up
ip addr add 10.96.2.2/24 dev eth0 2>/dev/null || true
ip route del default 2>/dev/null || true
ip route add default via 10.96.2.1 2>/dev/null || true
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "[+] Konfigurasi alpha selesai."
