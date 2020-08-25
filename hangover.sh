#!/bin/sh -e
 
# another cron-job that is set to specific dates. 
# Sends automated emails like "not feeling well/gonna 
# work from home" etc. Adds a random "reason" from 
# another predefined array of strings. Fires if there 
# are no interactive sessions on the server at 8:45am.

# Exit early if any session with my username is found
if who | grep -wq $USER; then
  exit
fi

# Phone numbers
MY_NUMBER='+xxx'
NUMBER_OF_BOSS='+xxx'

EXCUSES=(
  'Locked out'
  'Pipes broke'
  'Food poisoning'
  'Not feeling well'
)
rand=$[ $RANDOM % ${#EXCUSES[@]} ]

RANDOM_EXCUSE=${EXCUSES[$rand]}
MESSAGE="Gonna work from home. "$RANDOM_EXCUSE

# Send a text message
RESPONSE=`curl -fSs -u "$TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN" \
  -d "From=$MY_NUMBER" -d "To=$NUMBER_OF_BOSS" -d "Body=$MESSAGE" \
  "https://api.twilio.com/2010-04-01/Accounts/$TWILIO_ACCOUNT_SID/Messages"`

# Log errors
if [ $? -gt 0 ]; then
  echo "Failed to send SMS: $RESPONSE"
  exit 1
fi
