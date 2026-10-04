#!/bin/sh
# ==============================================================================
# Cek Status Jaringan Klien (Modul 2 - Kelompok K-65)
# ==============================================================================

echo "======================================"
echo "         STATUS JARINGAN KLIEN"
echo "======================================"

echo "
--- [1] Alamat IP Interface ---"
ip -br addr

echo "
--- [2] Default Gateway / Routing ---"
ip route

echo "
--- [3] DNS Resolver (/etc/resolv.conf) ---"
cat /etc/resolv.conf

echo "
--- [4] Uji Ping Gateway ---"
GW=$(ip route | grep default | awk '{print $3}')
if [ -n "$GW" ]; then
    ping -c 2 -W 2 $GW
fi
