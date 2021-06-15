# Electric Company
# Create a function that given a list which represents street lights given as a 
# parameter(l_street), determine if an outage has occurred. 
# A street with a total number of "F" greater than or equal to 2 returns "Outage", 
# anything below returns "Power"
# Example Input: [ T, F, F, F ]
# Example Output: "Outage"
# MY ANSWER
# DOESN'T WORK
# def outages(street):
#     count = 0
#     for a in street:
#         if a == "F":
#             count += 1
#             if count >= 2:
#                 return "Outage"
#             elif count < 2:
#                 return "Power"

# street = [ "T", "F", "F", "F" ]
# print(outages(street))
# street = ["T", "T", "T","F"]
# print(outages(street))

# RANDY'S ANSWER
def outage(list):
    F = 0
    for item in list:
        if item == "T":
            pass
        else:
            F += 1
    if F >= 2:
        return "Outage"
    else:
        return "Power"        
print(outage(["T", "F", "F", "F"]))