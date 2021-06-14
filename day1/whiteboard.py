# Create a function that given a string as a parameter of upper/lower case letters 
# and empty space characters (" "), return the length of the last word. 
# Meaning, the word that appears far most to the right if we loop through the words.
# Example Input: "Hello World"
# Example Output: 5

def famousLastWord(s):
    return len(s.split()[-1])
    # splitted = s.split()
    # lastwordfirst = splitted[-1]
    # length = len(lastwordfirst)
    # print(length)

print(famousLastWord("Hello World"))