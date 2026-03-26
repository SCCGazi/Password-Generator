#!/bin/bash
source /workspaces/Password-Generator/lib/tools.sh
echo "------------------------PASSWORD GENERATOR-------------------"
echo "----------------The app generates random passwords-----------"

# Character sets
LOWER="abcdefghijklmnopqrstuvwxyz"
UPPER="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SPECIAL="!@#$%^&*()-_=+[]{};:,.<>/?"
ALL="$LOWER$UPPER$DIGITS$SPECIAL"

    char_password()
    {
     # Ask for min and max length
        VALID=false
        num_passwords=$(getNumber "How many passwords to generate? ")
    while [ "$VALID" = false ]; do
        min_len=$(getNumber "Minimum password length: ")
        max_len=$(getNumber "Maximum password length: ")

        if [[ $min_len -gt $max_len ]]; then
            echo "ERROR: Minimum lenght must be less than Maximum lenght" >&2
        else
            VALID=true
        fi

    done
    
     # Generate passwords
    for ((i=1; i<=num_passwords; i++)); do
        length=$(( RANDOM % (max_len - min_len + 1) + min_len ))
        password="" 
       
        password+=${LOWER:$((RANDOM % ${#LOWER})):1} 
        password+=${UPPER:$((RANDOM % ${#UPPER})):1}
        password+=${DIGITS:$((RANDOM % ${#DIGITS})):1}
        password+=${SPECIAL:$((RANDOM % ${#SPECIAL})):1}

        # Fill the rest with random characters
        for ((j=5; j<=length; j++)); do
            password+=${ALL:$((RANDOM % ${#ALL})):1}
        done

        password=$(echo "$password" | fold -w1 | shuf | tr -d '\n')
        passwords+=("$password") 
    done

    # Display passwords
    echo "Generated passwords:"
    for ((i=0; i<${#passwords[@]}; i++)); do
        echo "$((i+1)). ${passwords[i]}"
    done
    generate_again
    }

    password()
    {
    # Ask for digits and number of random numbers
    digits=$(getNumber "Enter amount of digits: ")
    random=$(getNumber "How many random numbers to generate: ")
    # Input min and max
    VALID=false
    while [ "$VALID" = false ]; do
        min=$(getNumber "Min: ")
        max=$(getNumber "Max: ")
        result=$((max - min))
        count_min=${#min}
        count_max=${#max}
        if [[ $count_min -ne $digits ]]; then
            echo "ERROR: $min must be exactly $digits digits" >&2
        elif [[ $count_max -ne $digits ]]; then
            echo "ERROR: $max must be exactly $digits digits" >&2
        elif [[ $min -gt $max ]]; then
            echo "ERROR: Min must be less than Max" >&2
        elif [[ $min -eq $max ]]; then
            echo "ERROR: Min equal to Max" >&2
        elif [[ $random -ge $result ]]; then
            echo "ERROR: The number of randomly selected numbers is greater than the difference between the maximum and minimum numbers." >&2
        else
            VALID=true
        fi
    done

    # Generate random numbers
    numbers=()
    for ((i=1; i<=random; i++)); do
        while :; do
            rand=$(( RANDOM % (max - min + 1) + min ))
            found=false
            for n in "${numbers[@]}"; do
                if [[ "$n" -eq "$rand" ]]; then
                    found=true
                    break
                fi
            done

            if [[ "$found" = false ]]; then
                numbers+=("$rand")
                break
            fi
        done
    done

    # List the numbers
    echo "Generated numbers:"
    for ((i=0; i<${#numbers[@]}; i++)); do
        echo "$((i+1)). ${numbers[i]}"
    done
    generate_again
    }

    generate_again()
    {
    # Ask user if they want to generate again
    while true; do
        echo -n "Do you want to generate another set? (y/n): "
        read -n1 answer
        echo  # new line

        if [[ $answer == [Yy] ]]; then
            break  # exit inner loop to generate again
        elif [[ $answer == [Nn] ]]; then
            echo "Goodbye!"
            exit 0
        else
            echo "Invalid input, please press y or n"
        fi
    done
    }
 
      # Ask user if they want to generate again
    while true; do
        echo "-----------------------------------------------------------------"
        echo "Do you want to generate random passwords with characters?"
        echo -ne "Press y for yeas and n for no  (y/n):\n"
        echo "-----------------------------------------------------------------"
        read -n1 answer 
        echo  

        if [[ $answer == [Yy] ]]; then
               char_password
        elif [[ $answer == [Nn] ]]; then
               password
        else
            echo "Invalid input, please press y or n"
        fi
    done


