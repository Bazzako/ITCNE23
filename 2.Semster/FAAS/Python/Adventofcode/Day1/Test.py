import re

with open("input.txt") as open_file:
    lines_as_list = open_file.readlines()

def process_string(input_string):
    # Extrahiere alle Zahlen aus der Zeichenfolge
    numbers = re.findall(r'\d', input_string)

    # Wenn es mindestens eine Zahl gibt
    if numbers:
        first_number = numbers[0]
        last_number = numbers[-1]

        # Wenn es nur eine Zahl gibt, füge sie nochmals hinzu
        if len(numbers) == 1:
            result = first_number + first_number
        else:
            # Gib die ersten und letzten Zahlen aneinander aus
            result = first_number + last_number
    else:
        result = ''

    return result


for s in lines_as_list:
    result = process_string(s)
    print(result)


