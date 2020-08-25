#! /bin/bash
# simple calculator

clear
echo "
    Is Conda activating the base environment by default?
    "
bool_string=$(conda config --show | grep auto_activate_base)

echo "bool_string is: ${bool_string}"

case $bool_string in
    "auto_activate_base: False")echo "False: Conda is not activating base environment"
                                echo "Do you want to set it to True (y/n)) ?"
                                read i
                                if [ $i = "y" ]
                                then
                                    conda config --set auto_activate_base True
                                    conda config --show | grep auto_activate_base
                                fi;;
    "auto_activate_base: True")echo "True: Conda is activating base environment"
                               echo "Do you want to set it to False (y/n)) ?"
                               read i
                               if [ $i = "y" ]
                               then
                                   conda config --set auto_activate_base False
                                   conda config --show | grep auto_activate_base
                               fi;;
    *)echo "Invalid: unexpected string in 'conda config --show'";;
esac


  
