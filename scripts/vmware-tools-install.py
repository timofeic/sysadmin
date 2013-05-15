#!/usr/bin/env python
# -*- coding:utf-8 -*-

import glob
import os

import paramiko

def get_hostname(ip, ssh):
    # get the hostname
    stdin, stdout, stderr = ssh.exec_command('hostname')
    hosts = stdout.readlines()
    for host in hosts:
        print host

def main():
    fo = open("list_of_ips.txt", "r")
    list_of_ips=fo.readlines()
    fo.close()

    #ssh to the server

    for ip in list_of_ips:
        print "IP: ", ip
        ssh=paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        try:
            ssh.connect(ip.rstrip(), username='autobot', timeout=2)
        except Exception, e:
            print("Could not connect to %s" % ip.rstrip())
            continue

        get_hostname(ip, ssh)
        # check if tools is already installed, skip if it's installed.
        stdin, stdout, stderr = \
            ssh.exec_command("if [ -d /usr/lib/vmware-tools ] ; then echo yes; fi")
        for out in stdout:
            if out:
                print 'vmware-tools already installed.'
                continue

        stdin, stdout, stderr = \
        ssh.exec_command("sudo mkdir -p /mnt/cdrom; \
                        sudo mount /dev/cdrom /mnt/cdrom;\
                        sudo /bin/cp /mnt/cdrom/VMwareTools-8.3.12-493255.tar.gz /tmp;\
                        sudo umount /mnt/cdrom;\
                        cd /tmp;\
                        sudo tar xfz VMwareTools-8.3.12-493255.tar.gz")
        print "===stdout==="
        for out in stdout:
            if type(out) == str:
                print out
            else:
                print out.readlines()
        print "===stderr==="
        for err in stderr:
            print err

        ssh.exec_command("sudo /tmp/vmware-tools-distrib/vmware-install.pl --default;\
                sudo rm -rf /tmp/VMwareTools-8.3.12-493255.tar.gz /tmp/vmware-tools-distrib")
        print "===stderr==="
        for err in stderr:
            print err
        ssh.close()

if __name__ == '__main__':
    main()