#!/bin/bash
#
# THIS FILE IS MANAGED BY PUPPET
#
# Nagios plugin to check memory consumption
# Excludes Swap and Caches so only the real memory consumption is considered

. /usr/lib/nagios/plugins/utils.sh

# set default values for the thresholds

DHCP_RESPONSE=`sudo /usr/lib/nagios/plugins/check_dhcp`
echo $DHCP_RESPONSE

if [ "$DHCP_RESPONSE" = "CRITICAL: No DHCPOFFERs were received." ]; then
        echo "RESPONSE: ${DHCP_RESPONSE}"
        exit $STATE_CRITICAL;
else
        echo "RESPONSE: ${DHCP_RESPONSE}"
        exit $STATE_OK;
fi
