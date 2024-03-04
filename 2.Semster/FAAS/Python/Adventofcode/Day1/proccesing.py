with open("input.txt") as open_file:
    lines_as_list = open_file.readlines()

# Using a loop and isdigit() method
# Extract numbers from string
result = []
for char in lines_as_list:
    if char.isdigit():
        result.append(int(char))
print(result)