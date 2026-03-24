#!/bin/bash
source /workspaces/Password-Generator/lib/tools.sh
echo "-----PASSWORD GENERATOR-----"
echo "----------------------------"

# Ask for digits and number of random numbers
digits=$(getNumber "Enter amount of digits: ")
random=$(getNumber "How many random numbers to generate: ")

while true; do
    # Input min and max
    VALID=false
    while [ "$VALID" = false ]; do
        min=$(getNumber "Min: ")
        max=$(getNumber "Max: ")
        result=$((max - min))
        count_min=${#min}
        count_max=${#max}
        echo "result is $result"
        if [[ $count_min -ne $digits ]]; then
            echo "ERROR: $min must be exactly $digits digits" >&2
        elif [[ $count_max -ne $digits ]]; then
            echo "ERROR: $max must be exactly $digits digits" >&2
        elif [[ $min -gt $max ]]; then
            echo "ERROR: Min must be less than or equal to Max" >&2
        elif [[ $random -ge $result ]]; then
            echo "ERROR: The number of randomly selected digits is greater than the difference between the maximum and minimum digits." >&2
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
done