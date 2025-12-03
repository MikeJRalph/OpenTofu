#!/bin/bash

# =============================================
# Bash Basics Interactive Tutorial
# Run this script and learn by doing!
# =============================================

clear
echo "========================================"
echo "   Welcome to Bash Basics Tutorial!    "
echo "========================================"
echo "This script will teach you Bash step by step."
echo "Press ENTER to continue..."
read

# 1. Variables
clear
echo "1. VARIABLES"
echo "-------------"
name="Ada Lovelace"
age=36

echo "We just created two variables:"
echo "   name=\"$name\""
echo "   age=$age"
echo ""
echo "In Bash, you DON'T put spaces around the = sign."
echo "Correct:   name=\"John\""
echo "Wrong:     name = \"John\""

echo ""
echo "Let's ask for your name!"
read -p "Enter your name: " your_name
echo "Hello $your_name! Nice to meet you!"
sleep 2

# 2. Echo and strings
clear
echo "2. ECHO AND STRINGS"
echo "-------------------"
echo "Single quotes: '$your_name' → keeps everything literal"
echo "Double quotes: \"$your_name\" → expands variables"
echo ""
echo "You can concatenate with just putting things next to each other:"
greeting="Hello"
echo "$greeting there, $your_name! Today is $(date +%A)"
sleep 3

# 3. Reading input
clear
echo "3. READING INPUT WITH 'read'"
echo "---------------------------"
read -p "What's your favorite programming language? " lang
echo "Cool! $lang is awesome!"
sleep 2

# 4. Conditionals (if statements)
clear
echo "4. CONDITIONALS (if / else)"
echo "---------------------------"
read -p "How old are you? " user_age

if [ $user_age -lt 13 ]; then
    echo "Wow, you're young!"
elif [ $user_age -lt 20 ]; then
    echo "Teenager power!"
elif [ $user_age -lt 65 ]; then
    echo "Adulting is hard, right?"
else
    echo "Wisdom level: Expert!"
fi
sleep 3

# 5. Loops - for loop
clear
echo "5. FOR LOOP"
echo "-----------"
echo "Counting from 1 to 5..."
for i in 1 2 3 4 5
do
    echo "Number: $i"
    sleep 0.5
done

echo ""
echo "Now with a range {1..5}:"
for i in {1..5}; do
    echo "Countdown: $i"
    sleep 0.5
done
sleep 2

# 6. While loop + basic condition
clear
echo "6. WHILE LOOP + CONDITIONS"
echo "--------------------------"
counter=3
while [ $counter -gt 0 ]; do
    echo "Launch in T-$counter..."
    ((counter--))
    sleep 1
done
echo "BLAST OFF! 🚀"
sleep 2

# 7. Functions
clear
echo "7. FUNCTIONS"
echo "------------"
greet() {
    local person=$1
    echo "Hello from inside a function, $person!"
}

greet "$your_name"
greet "Grok"

sleep 2

# 8. Simple case statement
clear
echo "8. CASE STATEMENT (like switch)"
echo "------------------------------"
read -p "Do you like Bash so far? (yes/no/maybe) " answer

case $answer in
    yes|YES|y|Y) echo "Awesome! Keep going!" ;;
    no|NO|n|N)   echo "That's okay, it grows on you!" ;;
    maybe|*)     echo "Fair enough. Let's keep practicing!" ;;
esac
sleep 2

# 9. Bonus: Command line arguments
clear
echo "BONUS: COMMAND-LINE ARGUMENTS"
echo "----------------------------"
echo "You can pass arguments when running the script:"
echo "./bash-tutorial.sh Alice 25"
echo ""
echo "Argument 1: \$1 → first argument"
echo "All arguments: \"\$@\""
echo ""
echo "Try running this script again like:"
echo "./bash-tutorial.sh YourName 99"

# Final words
clear
echo "========================================"
echo "   You just learned Bash basics!      "
echo "========================================"
echo ""
echo "Key things to remember:"
echo "  • No spaces around = in variables"
echo "  • Use \$var or \${var} to expand variables"
echo "  • [ ] for conditions, (( )) for math"
echo "  • Quotes matter!"
echo ""
echo "Now go write your own scripts! 💻"
echo "Tip: Start with #!/bin/bash at the top"
echo ""
echo "Goodbye, $your_name!"

exit 0