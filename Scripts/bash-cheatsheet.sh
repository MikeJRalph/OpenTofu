#!/usr/bin/env bash
# =============================================
#     BASH CHEATSHEET – Quick Reference
# =============================================

# 1. Shebang & Execution
#!/bin/bash                    # Classic Bash
#!/usr/bin/env bash             # Portable (recommended)

chmod +x script.sh              # Make executable
./script.sh                     # Run it
bash script.sh                  # Run without chmod
source script.sh   OR . script.sh   # Run in current shell

# 2. Variables
name="Ada"                      # Assign (NO spaces!)
echo $name      echo "$name"    # Best: always quote
echo ${name}                    # Explicit (good for concatenation)
echo ${name:-default}           # Use default if unset
echo ${name:=default}           # Set and use default if unset
echo ${name// /_}               # Replace all spaces with _

readonly PI=3.14                # Constant
unset name                      # Delete variable

# 3. Special Variables
$0    → script name
$1,$2,…$9 → positional arguments
${10} → 10th argument and beyond
$#    → number of arguments
$@    → all arguments as separate words (use "$@" !)
$*    → all arguments as one word
$?    → exit status of last command (0 = success)
$$    → current shell PID
$!    → PID of last background command

# 4. Quotes
'literal'      → everything literal, even $ and `
"weak"         → variables and commands expand
`cmd`   OR $(cmd) → command substitution (prefer $())

# 5. Conditionals (test commands)
[ "$a" -eq "$b" ]               # numeric comparison
[ "$a" == "$b" ]                # string comparison (POSIX)
[[ "$a" == "$b" ]]              # Bash/Ksh/Zsh pattern matching

Common tests:
-eq  -ne  -lt  -le  -gt  -ge   → numbers
=    ==   !=                   → strings
-z "$var" → empty?
-n "$var" → not empty?
-f file  -d dir  -x file  -r file  -w file  -L file (symlink)

if [[ -f file && ( "$x" -gt 10 || "$y" == "yes" ) ]]; then
    ...
fi

# 6. If / Else Shortcuts
[[ -f file ]] && echo "exists" || echo "missing"
command && echo "worked" || echo "failed"

# 7. Loops
# For loop
for i in 1 2 3; do echo $i; done
for f in *.txt; do cp "$f" backup/; done
for ((i=1; i<=10; i++)); do echo $i; done   # C-style

# While / Until
while read line; do echo "→ $line"; done < file.txt
count=5; while ((count--)); do echo $count; sleep 1; done

# 8. Case statement
case "$1" in
    start)  echo starting ;;
    stop|halt) echo stopping ;;
    --help|-h) echo "usage…" ;;
    *)      echo "unknown option" >&2; exit 1 ;;
esac

# 9. Functions
hello() {
    echo "Hello $1!"
}
hello_world() { echo "Hello $1!"; }   # one-liner

return 0-255   # function exit code
# 10. Math
((a = 5 + 3))                 # Bash arithmetic
echo $((5 + 3))               # inside echo
let "x += 1"                  # old style
x=$((x + 1))

# 11. Arrays
fruits=("apple" "banana" "cherry")
echo ${fruits[1]}             # banana
echo ${fruits[@]}             # all elements
echo ${#fruits[@]}            # length
fruits+=("dragonfruit")       # append

# 12. Useful One-liners
# Print lines 5-10 of a file
sed -n '5,10p' file.txt
awk 'NR>=5 && NR<=10' file.txt

# Replace in all .txt files
find . -name "*.txt" -exec sed -i 's/foo/bar/g' {} +

# Run command on each file
for f in *.jpg; do convert "$f" -resize 50% "small/$f"; done

# Backup with timestamp
cp file.txt "file_$(date +%Y%m%d_%H%M%S).txt"

# 13. Redirection & Pipes
> file      → truncate & write
>> file     → append
< file      → input from file
2> err.log  → stderr to file
&> file     → both stdout+stderr
| tee file  → show and save

exec 2>/dev/null               # silence errors forever
command | grep "error" | wc -l

# 14. Here Documents & Here Strings
cat << EOF
Multiple
lines
of text
EOF

cat <<< "single line here string"

# 15. Debugging
set -x          # print each command before executing
set -e          # exit on any error
set -u          # error on unset variables
set -o pipefail # pipeline fails if any part fails

trap 'echo "Error on line $LINENO"' ERR

# 16. Best Practices (one-liners)
# Always quote variables: "$var" not $var
# Use shellcheck.net on every script
# Prefer [[ ]] over [ ] in Bash
# Use "$@" not $* or $@
# Exit with proper codes (0 = success, 1-255 = error)

# 17. Quick Reference Table
Command          Meaning
---------------------------------------
pwd              print working directory
ls -la           list all + hidden
cd -             go to previous directory
mkdir -p         create parents if needed
rm -rf           (danger!) recursive force delete
cp -a            copy preserving everything
mv               move/rename
touch file       create empty file or update timestamp
cat              display file
less             pager
grep -r "text" . search recursively
find . -name "*.sh" 
xargs            build and execute commands from input
tar -czf archive.tar.gz folder/
tar -xzf archive.tar.gz
ps aux | grep python
kill -9 PID
top / htop
df -h            disk free
du -sh *         size of files/folders
curl -O URL      download file
wget -qO- URL    get URL content

# Save this cheatsheet forever
curl -sL https://raw.githubusercontent.com/onceupon/Bash-Cheat-Sheet/master/bash-cheatsheet.md -o ~/bash-cheatsheet.md