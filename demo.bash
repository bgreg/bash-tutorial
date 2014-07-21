#!/bin/bash

echo "Welcome to talk 2 of the bash series"
echo "Last time we got a little history lesson, and basic overview of how shells work, now we will just practice using the shell for some basic tasks"

read
echo "Lets make a file"
read
echo "% touch new_file.txt"
read
touch new_file.txt

read
echo "set access to the file to 'writeable'"
read
echo "% chmod +w new_file.txt"
read
chmod +w new_file.txt

read
echo "Now, lets see what is in it"
read
echo "% cat new_file.txt"
read
cat new_file.txt

read
echo "Nothing yet, so lets add some stuff to the file"
read
echo "for extra credit, come back to this part and try to figure out what it is doing"
read
cool_thing_to_say="Neutra Odd Future High Life, you probably haven't heard of them art party selvage narwhal street art chillwave paleo yr pour-over Intelligentsia umami wayfarers. Truffaut drinking vinegar Etsy, forage lo-fi leggings locavore ennui plaid vinyl stumptown 8-bit cardigan. Wes Anderson dreamcatcher chia next level, tousled fingerstache hella umami photo booth quinoa Tumblr kitsch vinyl. Portland quinoa banjo readymade. Sustainable selfies hashtag leggings fap. Godard Neutra DIY whatever gastropub. Mlkshk banh mi DIY, Neutra +1 Godard Helvetica Blue Bottle."
a=($cool_thing_to_say)
num_words=${#a[*]}

for i in {1..300}
do
  echo "${a[$((RANDOM%num_words))]} ${a[$((RANDOM%num_words))]} ${a[$((RANDOM%num_words))]}" >> new_file.txt
done

read
echo "And now we can view that file a few different ways"

read
echo "The whole file at once"
read
echo "% cat new_file.txt"
read
cat new_file.txt

read
echo "The whole file, including hidden end of line chars"
read
echo "% cat -v new_file.txt"
read
cat -v new_file.txt

read
echo "How about just the first 5 lines?"
read
echo "% head -5 new_file.txt"
read
head -5 new_file.txt

read
echo "Last 5 lines"
read
echo "% tail -5 new_file.txt"
read
tail -5 new_file.txt

read 
echo "Here is how you 'follow' a file, very usefull for watching log files"
read
echo "% tail -f new_file.txt"


read
echo "Lets open up the file in most popular document reader"
read
echo "% less new_file.txt"
read
less new_file.txt

read
echo "Less is cool, to learn more about it we should read it's manual. But how?"
read
echo "% man man, man"
read
man man

read
echo "Now for the less manual"
read
echo "% man less"
read
man less

read
echo "so search up is ?, and search down is /, next value is n, and quit is q"

read
echo "That was a manual search, grep is how we do automated searching"
echo "Search for the word 'Life',  we use: grep [pattern] path"
read
echo "% grep Life new_file.txt"
read
grep Life new_file.txt

read
echo "Search for the word 'life', but we forgot the case to use. -i will ignore case"
read
echo "% grep -i life new_file.txt"
read
grep -i life new_file.txt

read
echo "Want to know how many times that word occurs?, use count: '-c'"
read
echo "% grep -c [pattern] path"
read
echo "% grep -c  Life new_file.txt"
read
grep -c  Life new_file.txt

read
echo "want to know every line if the file that starts with 'Life', in that case we need to learn what the 're' means in grep"
read
echo "grep means: globally search a regular expression and print"

read
echo "Here are the the minimum aspects of regular expressions you should learn"
read
echo ". means any single character"
read
echo "* Matches the preceding element zero or more times."
read
echo "^ Matches the start of the line."
read
echo "$ Matches the end of the line."
read
echo "[ ] Matches a single character that is contained within the brackets."
read
echo "[^ ] Matches a single character that is not contained within the brackets."

read
echo "Examples"

read
echo "Lines that start with the word Life"
read
echo "% grep ^Life new_file.txt"
read
grep ^Life new_file.txt

read
echo "Lines that end with the word Life"
read
echo "% grep Life$ new_file.txt"
read
grep Life$ new_file.txt

read
echo "Lines that have ' life '  "
read
echo '% grep " life " new_file.txt'
read
grep " life " new_file.txt

read
echo "lines that containe words that start with 'l'"
read
echo '% grep ' l.*' new_file.txt'
read
grep ' l.*' new_file.txt

read
echo "lines that contain words that that contain a z or a"
read
echo '% grep [za] new_file.txt'
read
grep [za] new_file.txt

read
echo "lines that don't contain a z or an a"
read
echo '% grep [^za] new_file.txt'
read
grep [^za] new_file.txt

read
echo "now lets search a bunch of files, use a file glob instead of a file name. "
read
echo "use ? for matching single characters, and * for matching anything"
read
echo '% cp new_file.txt another.txt'
read
echo '% cp new_file.txt and_another.txt'
read
echo '% grep [^za] *.?xt'
read
echo 'for more: http://rubular.com/'
read
cp new_file.txt another.txt
cp new_file.txt and_another.txt
grep [^za] *.?xt

read
echo "we can also use file globbing to just find files"
read
echo 'find . -type f -name "*.?xt" 2>/dev/null'
read
echo '  ^   that means current directory, it is NOT a regular expression or a file glob in this context.'
read
echo '           ^     only return files'
read
echo '                     ^ files that start with anything, have a period, then any single letter, then end with xt'
read
echo '                             ^  redirect all the errors to null'
read

find . -type f -name "*.?xt" 2>/dev/null
#    ^   that means current directory, it is NOT a regular expression or a file glob in this context.
#           ^     only return files
#                      ^ files that start with anything, have a period, then any single letter, then end with xt
#                             ^  redirect all the errors to null

read
echo "what if you want to search the whole home drectory for tha file?, instead of '.' just just '~' for the root directory "
read
echo "this will search all of home directory, return only files that end it .(any single letter)xt"
read
echo '% find ~ -type f -name "*.?xt" 2>/dev/null'
find ~ -type f -name "*.?xt" 2>/dev/null
echo "Big search over"

read
echo "The whole computer, pass it root:  'find / -type f -name "*.?xt" 2>/dev/null | wc -l'"

read
echo "Empty our file, also called clobbering"
read
echo '% echo "" > new_file.txt'
read
echo "" > new_file.txt

read
echo "How man lines are left in the file?"
read
echo '% cat new_file.txt | wc -l'
read
cat new_file.txt | wc -l

read
echo "Clean up our files"
read
echo '% rm  new_file.txt'
read
echo '% rm  another.txt'
read
echo '% rm  and_another.txt'
read
rm  new_file.txt
rm  another.txt
rm  and_another.txt

read
echo "Thats all folks!"
read
echo "And now a blatant Mission Immpossible reference"
read
say "I will self destruct in 10 seconds"; for (( i = 10; i > 0; i-- )); do  say $i ; done
