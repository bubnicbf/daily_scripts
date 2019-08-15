from pynput import keyboard
import webbrowser
import subprocess
import os
import os.path
import sys
import time
#--------------------------FILE PATH-----------------------------------------------
os.system('mode con: cols=51 lines=12')
direct = os.getcwd()
line_sep = "**********************************************"
#---------------------------------DECORATIONS------------------------------------
str = ["**************************************************",
 "**************************************************",
 "**************************************************",
       "**************************************************",
       "**************************************************",
 "***                                            ***",
 "***                                            ***",
 "***                                            ***",
"**************************************************",
 "**************************************************",
       "**************************************************",
       "**************************************************",
 "**************************************************"]

hk_created = ["**************************************************",
 "**************************************************",
 "**************************************************",
              "**************************************************",
              "**************************************************",
 "***                                            ***",
 "***               HOTKEY CREATED!!             ***",
 "***                                            ***",
"**************************************************",
 "**************************************************",
              "**************************************************",
              "**************************************************",
 "**************************************************"]

blank_dec = ""
hk_dec = ""

for i in str:
    blank_dec += i + '\n'

for k in hk_created:
    hk_dec += k + '\n'


def hotkeyCreatedBlink():
    time_keep = 0

    while(time_keep != 4):
        print(hk_dec)
        time.sleep(0.3)
        os.system('cls')
        print(blank_dec)
        time.sleep(0.3)
        os.system('cls')
        time_keep += 1

#---------------------------------------------------------------------------------
# The currently active modifiers
current = set()
#----------------------THE IMPORTANT FUNCTION----------------------------------

#make a method that goes back to main method
def execute(key):
    a_key = '{0} pressed'.format(key).replace("pressed", "").strip().upper()

    for k in dict_keys:
        k = "'" + k + "'"
        k = k.strip().upper()
        #print(a_key)
        if a_key == k:
         #   print("MATCH FOUND")
            a_key = a_key.replace("'", "")
            web_or_app = dict_keys.index(a_key)
            web_or_app = dict_values[web_or_app]
            if web_or_app[0:2] == "W=":
                try:
                    webbrowser.open(web_or_app[2:])
                except Exception as e:
                    print("Something went wrong. Is the website's URL correct?")
                    print(e)
            elif web_or_app[0:2] == "A=":
                try:
                    os.system(web_or_app[2:])
                except:
                    print("Something went wrong with the hotkey for the character " + a_key + ".\nEdit the hotkey or try again.")
#----------------------------------------------------------------------------------
def pressed(key):
    if any([key in COMBO for COMBO in COMBINATIONS]):
        current.add(key)
        if any(all(k in current for k in COMBO) for COMBO in COMBINATIONS):
            execute(key)
#-------------------------------------------------------------------------------
def released(key):
    if any([key in COMBO for COMBO in COMBINATIONS]):
        current.remove(key)

#--------------------------------------------------------------------------------HOTKEY--------------------------------------------------------------------------
# The key combination to check

COMBINATIONS = []
dict_keys = []
dict_values = []
COMBINATIONS_str = []

#Open all the files

path = os.path.dirname(__file__)
keysfile = os.path.join(path, "dict_keys.txt" )
dict_keys_file = open(keysfile, "r")

valuesfile = os.path.join(path, "dict_values.txt" )
dict_values_file = open(valuesfile, "r") #gets the combinations of key and values

combofile = os.path.join(path, "COMBINATIONS.txt" )
COMBINATIONS_file = open(combofile, "r")

#read in key values
line3 = dict_keys_file.readline()
while(line3):
    dict_keys.append(line3.replace('\n', "").strip())
    line3 = dict_keys_file.readline()

#read in value values
line1 = dict_values_file.readline()
while(line1):
   # print(line1)
    dict_values.append(line1.replace("\n", "".strip()))
    line1 = dict_values_file.readline()

line2 = COMBINATIONS_file.readline()
while(line2):
    COMBINATIONS.append(eval(line2))
    COMBINATIONS_str.append(line2.replace("\n", "").strip())
    line2 = COMBINATIONS_file.readline()


dict_values_file.close()
#dict_values_filefile = open("hotkeys/dict_value.txt", "r")
#--------------------GET INPUT-------------------------------------------------------

def createHotkey():
    input_loop = True

    while(input_loop):
        i = input("Enter a character: ").strip().upper()
        while(len(i) != 1):
            os.system('cls')
            i = input("Please enter just one character: ")
            if i == "menu":
                mainn()

        if i.lower() == "menu":
            mainn()

        if i in dict_keys:
            i = input("\nThat character is already used.\nPlease enter another character: ")
            os.system('cls')
            if i == "menu":
                mainn()
            if i not in dict_keys:
                dict_keys.append(i)
                input_loop = False
        else:
            with open(keysfile, "a") as dict_keys_file:
                if i.upper() not in dict_keys:
                    dict_keys_file.write(i.upper() + "\n")
            dict_keys.append(i.upper())
            input_loop = False


    os.system('cls')
    print("Assign a choice (enter the corresponding number): \n1. Website\n2. Application\n")
    choice = input("Enter choice number here: ")
    if choice == "menu":
        mainn()

    loop_cont = True
    choice_str = ""


    #Get input from the user and put it into the dictionary
    string_check = ""
    while(loop_cont):
        if choice == "1":
            web = input("Enter the website link: ").strip() #key-value the character and website
            string_check = "W=" + web
            while(string_check in dict_values):
                web = input("That website is already binded to a key.\nEnter another website: ")
                string_check = "W=" + web
                if web == "menu":
                    mainn()
            if web == "menu":
                mainn()
            choice_str = "W=" + web
            i = i.upper()
            dict_values.append(choice_str)
            loop_cont = False
        elif choice == "2":
            app = input("Enter the application's path: ").strip() #key-value the character and application
            if app == "menu":
                mainn()
            choice_str = "A=" + app
            i = i.upper()
            dict_values.append(choice_str)
            loop_cont = False
        else:
            choice = input("Please enter a valid option: ").strip()
            if choice == "menu":
                mainn()

    with open(valuesfile, "a") as dict_values_file:
        dict_values_file.write(choice_str + "\n")


    #APPEND HOTKEY TO COMBINATIONS
    mod = "{" + "keyboard.Key.shift"
    char = "keyboard.KeyCode(char=" + "'" + i + "'" + ")" + "}"
    char2 = "keyboard.KeyCode(char=" + "'" + i.upper() + "'" + ")" + "}"
    hotkey = mod + ", " + char
    hotkey2 = mod + ", " + char2
    with open(combofile, "a") as COMBINATIONS_file:
        if hotkey2 not in COMBINATIONS_str:
            COMBINATIONS_file.write(hotkey + "\n")
            #COMBINATIONS_file.write(hotkey2 + "\n")
    hotkey = eval(hotkey) #Changing the string into a class to be able to be used
    #hotkey2 = eval(hotkey2)
    COMBINATIONS.append(hotkey)
    #COMBINATIONS.append(hotkey2)
    os.system('cls')
    hotkeyCreatedBlink()

    mainn()

def startHotkey():
    with keyboard.Listener(on_press=pressed, on_release=released) as listener:
        listener.join()

def editHotkey():
    keys_file = open(keysfile, "r")
    values_file = open(valuesfile, "r")  # gets the combinations of key and values

    line1 = keys_file.readline()
    line2 = values_file.readline()
   # print(line1)
    #print(line2)
    acc = 1
    acc_list = []
    print("Your current Hotkeys: ")
    while (line2):
       # print(line1)
        #print(line2[2:])
       # print("THIS LINE " + str(acc) + line1 + line2[2:])
        print(acc, ". " + line1.strip() + " = " + line2[2:].strip())
        line1 = keys_file.readline().replace("\n", "")
        line2 = values_file.readline()
        acc += 1


    to_edit = input("Which character would you like to edit?\nEnter the corresponding number: ").strip()


    if to_edit == "menu":
        mainn()
    else:
        to_edit = int(to_edit)

    while(to_edit > acc):
        to_edit = str(input("Enter a valid corresponding number: ")).strip()
        if to_edit == "menu":
            mainn()
    #THE TRUE INDEX, IMPORTANT
    true_index = int(to_edit) - 1

    os.system('cls')
    print("Assign a choice (enter the corresponding number): \n1. Website\n2. Application\n")
    choice = input("Enter choice number here: ")
    if choice == "menu":
        mainn()

    loop_cont = True
    choice_str = ""

    loop_cont = True
    choice_str = ""
    #Get input from the user and put it into the dictionary
    while(loop_cont):
        if choice == "1":
            web = input("Enter the website link: ").strip() #key-value the character and website
            if web == "menu":
                mainn()
            choice_str = "W=" + web
            dict_values[true_index] = choice_str.strip()
            new_values_file = open(valuesfile, "r+")
            new_values_file.truncate()
            for val in dict_values:
                new_values_file.write(val + "\n")
            new_values_file.close()
            loop_cont = False
        elif choice == "2":
            app = input("Enter the application's path: ").strip() #key-value the character and application
            if app == "menu":
                mainn()
            choice_str = "A=" + app
            dict_values[true_index] = choice_str
            new_values_file = open(valuesfile, "r+")
            new_values_file.truncate()
            for val in dict_values:
                new_values_file.write(val + "\n")
            new_values_file.close()
            loop_cont = False
        else:
            choice = input("Please enter a valid option: ").strip()
            if choice == "menu":
                mainn()

    mainn()

#--------------------------------------------DELETE ALL HOTKEYS-----------------------------------------------------------
def deleteHotkeys():
    dict_keys_file = open(keysfile, "r+")
    dict_values_file = open(valuesfile, "r+")  # gets the combinations of key and values
    COMBINATIONS_file = open(combofile, "r+")

    dict_keys_file.truncate()
    dict_values_file.truncate()
    COMBINATIONS_file.truncate()

    dict_keys_file.close()
    dict_values_file.close()
    COMBINATIONS_file.close()
    COMBINATIONS = []
    dict_keys = []
    dict_values = []
    COMBINATIONS_str = []

    print("All your Hotkeys have been deleted!!")
    print("Press Enter to return to the main menu..")
    input()
    mainn()

#------------------------------------------------------------MAIN--------------------------------------------------------

def main_method():
    #print(dict_keys)
    #print(dict_values)
    #print(COMBINATIONS)
    #print(COMBINATIONS_str)
    print("******************HOTKEY PROGRAM******************")
    print("Enter an option that corresponds to a choice")
    print("1. Create a Hotkey")
    print("2. Edit a Hotkey")
    print("3. Start the Hotkey Program")
    print("4. Delete all Existing Hotkeys\n")
    option_choice = input("Enter your choice here: ").strip()
    if option_choice == "menu":
        mainn()

    main_loop = True
    while(main_loop):
        if option_choice == "1":
            os.system('cls')
            createHotkey()
        elif option_choice == "2":
            os.system('cls')
            editHotkey()
        elif option_choice == "3":
            os.system('cls')
            startHotkey()
        elif option_choice == "4":
            os.system('cls')
            deleteHotkeys()
        else:
            option_choice = input("Please enter a valid option: ").strip()
            if option_choice == "menu":
                mainn()

def mainn():
    os.system('cls')
    main_method_cont = True
    while(main_method_cont):
        main_method()
        keep_going = input("Go back to Start Menu? Enter Y to Continue or N to Quit Program: ").strip().upper()
        if keep_going == "Y":
            main_method_cont == True
        elif keep_going == "N":
            main_method_cont = False
            sys.exit()
        else:
            keep_going = input("Please enter a valid option: ").strip().upper()
mainn()

COMBINATIONS_file.close()
dict_keys_file.close()
dict_values_file.close()


