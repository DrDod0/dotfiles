#! /bash/bin
# Author: @veggietorta
# Update: 08.11.21
# Purpose: Wifi tools via command line

# Requirements
    #

# main menu
# option 1: see current connections
# option 2: see available wifi connections
# option 3: establish new connection


check_for_requirements ()
{
    # If-statement checks for installations of requirements
}


check_for_existing_alias ()
{
    bashrc_file="/home/vt/.bashrc"
    string_to_search="wifi"

    # -q    :quiet, do not write anything to standard output
    # -i    :ignore case, both in patter and input file

    if grep -iq $string_to_search $bashrc_file
    then
        convert_files
    else
        create_alias
    fi
}

main_menu ()
{
    echo Select option
    echo 1: Output current connection
    echo 2: Output Available wifi networks
    echo 3: Establish new connection

    read main_menu_selection

    if [ "$main_menu" =

}


main_menu
