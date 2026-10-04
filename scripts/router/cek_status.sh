#!/bin/sh
# ==============================================================================
# Cek Status Jaringan & NAT Router rootkit (Modul 2 - Kelompok K-65)
# ==============================================================================

echo "======================================"
echo "   STATUS JARINGAN ROUTER ROOTKIT"
echo "======================================"

echo "
--- [1] Status Alamat IP Interface ---"
ip -br addr

echo "
--- [2] Tabel Routing Kernel ---"
route -n

echo "
--- [3] Status IPv4 Forwarding ---"
sysctl net.ipv4.ip_forward

echo "
--- [4] Tabel iptables NAT POSTROUTING ---"
iptables -t nat -L POSTROUTING -v -n
