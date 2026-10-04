#!/bin/bash
# ==============================================================================
# PRAKTIKUM JARINGAN KOMPUTER 2026 - MODUL 2
# KELOMPOK: K-65 | PREFIX SUBNET: 10.96.x.x
# SOAL 3: Routing Inter-Subnet dan DNS Resolver Tunggal (192.168.122.1)
# ==============================================================================

# ---- SEMUA NODE KLIEN NON-ROUTER ----
# Pastikan resolver hanya menggunakan 192.168.122.1 tanpa DNS Google
cat <<EOF > /etc/resolv.conf
nameserver 192.168.122.1
EOF

# Uji komunikasi lintas divisi / inter-subnet:
# Dari Subnet 2 (alpha) ping ke Subnet 1 (prab):
ping -c 3 10.96.1.2

# Dari Subnet 3 (delta) ping ke Subnet 4 (abbey):
ping -c 3 10.96.4.2

# Dari Subnet 4 (abbey) ping ke Subnet 5 (penny):
ping -c 3 10.96.5.2
