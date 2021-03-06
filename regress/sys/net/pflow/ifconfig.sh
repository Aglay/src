#! /bin/sh

echo '#### up'
ifconfig pflow0 up; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### flowdst syntax error'
ifconfig pflow0 flowdst; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### invalid flowdst port'
ifconfig pflow0 flowdst 127.0.0.1:0; ifconfig pflow0 | grep -v \
	'^[[:space:]]index'
echo '#### flowdst set, invalid flowsrc'
ifconfig pflow0 flowdst 127.0.0.1:9996; ifconfig pflow0 | grep -v \
	'^[[:space:]]index'
echo '#### flowsrc and flowdst set'
ifconfig pflow0 flowsrc 127.0.0.1; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### unset flowdst'
ifconfig pflow0 -flowdst; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### unset flowsrc'
ifconfig pflow0 -flowsrc; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### flowsrc and flowdst set one command'
ifconfig pflow0 flowsrc 127.0.0.1 flowdst 127.0.0.1:9996; ifconfig pflow0 | \
	grep -v '^[[:space:]]index'
echo '#### proto 9'
ifconfig pflow0 pflowproto 9; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### proto 10'
ifconfig pflow0 pflowproto 10; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### proto 5'
ifconfig pflow0 pflowproto 5; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### syntax error proto'
ifconfig pflow0 pflowproto 23; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### flowdst 0.0.0.0:0; INVALID:INVALID'
ifconfig pflow0 flowdst 0.0.0.0:0; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### flowdst 0.0.0.0:1234; INVALID:1234'
ifconfig pflow0 flowdst 0.0.0.0:1234; ifconfig pflow0 | grep -v \
	'^[[:space:]]index'
echo '#### flowsrc 0.0.0.0; INVALID'
ifconfig pflow0 flowsrc 0.0.0.0; ifconfig pflow0 | grep -v '^[[:space:]]index'
echo '#### destroy'
ifconfig pflow0 destroy; ifconfig pflow0 | grep -v '^[[:space:]]index'
