#!/bin/bash
# set up some default firewall policies

# Print existing table
iptables -L
# Flush existing table
iptables -F

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow Incoming SSH, port 22
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow inbound DNS, udp port 53
iptables -A INPUT -p udp -i eth0 --sport 53 -j ACCEPT

# Allow Incoming, Outgoing HTTP, port 80
iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

# Allow Incoming, Outgoing HTTPs, port 443
iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Allow ping from inside to outside
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

# Loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Simple DoS prevention - limit 30 connections/min after 100 connections have been made
iptables -A INPUT -p tcp --dport 80 -m limit --limit 30/minute --limit-burst 100 -j ACCEPT

# Optional - depending on the server
# Allow ping from outside to inside
#iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
#iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

# Allow Sendmail or Postfix
#iptables -A INPUT -i eth0 -p tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 25 -m state --state ESTABLISHED -j ACCEPT

# Allow rsync from a specific network
#iptables -A INPUT -i eth0 -p tcp -s 192.168.101.0/24 --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 873 -m state --state ESTABLISHED -j ACCEPT

# Print new table
iptables -L

# Finally save the new rules
service iptables save
