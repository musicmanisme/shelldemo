#!/usr/bin/expect

set TELNET_IP 192.168.1.251
set TELNET_PORT 12030

set timeout 3
spawn telnet $TELNET_IP $TELNET_PORT
expect "Escape*"

for {set i 0} {$i<$argc} {incr i} {
 set cmd [lindex $argv $i]
 send "$cmd\r";
 expect "*succe" {puts "ok"}
}
