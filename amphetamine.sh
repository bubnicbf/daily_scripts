tell application "Amphetamine"

    set sessionActiveTest to session is active

    if sessionActiveTest is false then

        if (q is not in {"", null}) then
            
            set hoursOnly to no
            
            if (q contains "h") and (q does not contain "m") then
                set hoursOnly to yes
            end if
            
            -- Remove text from argument
            set q to (do shell script "echo " & q & " | sed 's/hours//g'")
            set q to (do shell script "echo " & q & " | sed 's/hour//g'")
            set q to (do shell script "echo " & q & " | sed 's/minutes//g'")
            set q to (do shell script "echo " & q & " | sed 's/min//g'")
            set q to (do shell script "echo " & q & " | sed 's/h//g'")
            set q to (do shell script "echo " & q & " | sed 's/m//g'")
            
            set someHours to 0
            set someMinutes to 0
            
            if q contains " " then
                
                -- Separate hours and minutes
                set AppleScript's text item delimiters to " "
                set someHours to text item 1 of q as number
                set someMinutes to text item 2 of q as number
                set AppleScript's text item delimiters to ""
                
                -- Multiply & add to get total seconds
                set someHours to someHours * 60 
                set someMinutes to someMinutes 
                
                set q to someHours + someMinutes
                
            else -- No space, assume only minutes
                
                if hoursOnly is yes then
                    set q to q * 60 
                else
                    set q to q 
                end if
                
            end if
            
            start new session with options {duration:q, interval:minutes, displaySleepAllowed:false}
            
        else
            
            start new session
            
        end if
    
    else
    
        tell me to activate
        display dialog "An Amphetamine session is already running. End the current session using the \"end session\" workflow command." buttons {"OK"} default button "OK"
    
    end if

end tell
