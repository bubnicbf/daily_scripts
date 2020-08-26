#!/usr/bin/env ruby

# this one waits exactly 17 seconds 
# then opens a telnet session to our
# coffee-machine, runs linux and has
# a TCP socket up and running, and
# sends something like sys brew.
# starts brewing a mid-sized half-caf latte and waits
# another 24 seconds before pouring it into a cup. 
# timing is exactly how long it takes to walk to there

# Exit early if no sessions with my username are found
exit unless `who -q`.include? ENV['USER']

require 'net/telnet'

coffee_machine_ip = '10.10.42.42'
password = '1234'
password_prompt = 'Password: '
delay_before_brew = 17
delay = 24

sleep delay_before_brew
con = Net::Telnet.new('Host' => coffee_machine_ip)
con.cmd('String' => password, 'Match' => /#{password_prompt}/)
con.cmd('sys brew')
sleep delay
con.cmd('sys pour')
con.close
