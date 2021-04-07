global vpn_url, keychain_key, app_title, connection_state_polling_interval
set app_title to "My AnyConnect VPN"
set vpn_url to "https://some.ssl.vpnserver"
set keychain_key to "My_AnyConnect_VPN"
set connection_state_polling_interval to 10

(* Custom handlers *************************************************************)
on is_connected()
    set command_output to do shell script "/opt/cisco/anyconnect/bin/vpn status"
    log command_output
    if command_output contains "state: Connected" then
        return true
    end if
    return false
end is_connected

on connect()
    if not is_connected() then
        set username to do shell script "security find-generic-password -l " & quoted form of keychain_key & " | sed -n -e 's/.*\\(\\\"acct\\\"<blob>=\\\"\\)\\(.*\\)\\\"/\\2/p'"
        set pswd to do shell script "/usr/bin/security find-generic-password -wl " & quoted form of keychain_key
        set command_output to do shell script "printf '" & username & "
" & pswd & "
y' | /opt/cisco/anyconnect/bin/vpn -s connect " & vpn_url
        
        log command_output
        
        if is_connected() then
            display notification "Connected to " & vpn_url with title app_title
        else
            display notification "Failed to connect to " & vpn_url with title app_title
        end if
    else
        display notification "Already connected to " & vpn_url with title app_title
    end if
end connect

(* System handlers *************************************************************)
on idle
    try
        if not is_connected() then
            quit
        end if
    on error number -128
        tell me to quit
    end try
    return connection_state_polling_interval
end idle


on reopen
    set command_output to do shell script "/opt/cisco/anyconnect/bin/vpn status"
    set alert_title to "VPN: " & vpn_url
    display alert alert_title message command_output
end reopen


on quit
    if is_connected() then do shell script "/opt/cisco/anyconnect/bin/vpn disconnect"
    if is_connected() then
        display notification "Failed to disonnect from " & vpn_url with title app_title
    else
        continue quit
    end if
end quit


(* Run the script *************************************************************)
try
    my connect()
on error error_msg
    if error_msg is "The command exited with a non-zero status." then
        display notification "Failed to connect to " & vpn_url with title app_title
    end if
end try