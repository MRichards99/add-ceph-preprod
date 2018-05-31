#!/bin/bash
# Written by Matthew Richards
# Written to add Ceph storage nodes to preprod

for i in ceph-sn{937..957}
do
    foo=$(host $i | sed -ne 's/^.*has address //p')
echo -e "define host {
\tuse             ceph-echo-generic-host
\thost_name       $i
\taddress         $foo
\thostgroups      ceph-echo-staging
}"
done