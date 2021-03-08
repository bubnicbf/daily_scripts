#! /bin/bash
# Create a file named explorys.xml with the following contents in /opt/cisco/anyconnect/profile

sudo chmod -R 777 /opt/cisco/anyconnect/profile/

cat << EOF > /opt/cisco/anyconnect/profile/explorys.xml
<AnyConnectProfile>
        <ServerList>
            <HostEntry>
                <HostName>vpn1.explorys.com</HostName>
                <HostAddress>https://vpn1.explorys.com</HostAddress>
            </HostEntry>
        </ServerList>
</AnyConnectProfile>
EOF