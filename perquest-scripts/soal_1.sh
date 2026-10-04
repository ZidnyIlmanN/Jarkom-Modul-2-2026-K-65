#!/bin/bash
# ==============================================================================
# PRAKTIKUM JARINGAN KOMPUTER 2026 - MODUL 2
# KELOMPOK: K-65 | PREFIX SUBNET: 10.96.x.x
# SOAL 1: Setup Topologi, Pengkabelan (Wiring), dan Konfigurasi Antarmuka Jaringan
# ==============================================================================

# ---- 1. NODE ROOTKIT (ROUTER SENTRAL - DEBINET) ----
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet dhcp

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
service networking restart 2>/dev/null || /etc/init.d/networking restart 2>/dev/null || true

# Verifikasi Router rootkit
echo "=== VERIFIKASI ROUTER ROOTKIT ==="
ip -br addr
route -n

# ---- 2. SUBNET 1: RESOLUSI & REPOSITORI (10.96.1.0/24 - GATEWAY: 10.96.1.1) ----
# Node: prab (10.96.1.2)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.1.2
    netmask 255.255.255.0
    gateway 10.96.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: tedd (10.96.1.3)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.1.3
    netmask 255.255.255.0
    gateway 10.96.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: obladi (10.96.1.4)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.1.4
    netmask 255.255.255.0
    gateway 10.96.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: desmond (10.96.1.5)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.1.5
    netmask 255.255.255.0
    gateway 10.96.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: oblada (10.96.1.6)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.1.6
    netmask 255.255.255.0
    gateway 10.96.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: molly (10.96.1.7)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.1.7
    netmask 255.255.255.0
    gateway 10.96.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# ---- 3. SUBNET 2: KLIEN SAYAP KIRI (10.96.2.0/24 - GATEWAY: 10.96.2.1) ----
# Node: alpha (10.96.2.2)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.2.2
    netmask 255.255.255.0
    gateway 10.96.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: beta (10.96.2.3)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.2.3
    netmask 255.255.255.0
    gateway 10.96.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: gamma (10.96.2.4)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.2.4
    netmask 255.255.255.0
    gateway 10.96.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# ---- 4. SUBNET 3: KLIEN SAYAP KANAN (10.96.3.0/24 - GATEWAY: 10.96.3.1) ----
# Node: delta (10.96.3.2)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.3.2
    netmask 255.255.255.0
    gateway 10.96.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# Node: epsilon (10.96.3.3)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.3.3
    netmask 255.255.255.0
    gateway 10.96.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# ---- 5. SUBNET 4: GERBANG ABBEY (10.96.4.0/24 - GATEWAY: 10.96.4.1) ----
# Node: abbey (10.96.4.2)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.4.2
    netmask 255.255.255.0
    gateway 10.96.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF

# ---- 6. SUBNET 5: GERBANG PENNY (10.96.5.0/24 - GATEWAY: 10.96.5.1) ----
# Node: penny (10.96.5.2)
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.96.5.2
    netmask 255.255.255.0
    gateway 10.96.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
EOF
