
import csv

config = []

with open('memory.csv') as file: 
    file = csv.reader(file, delimiter=',')

    first_row = True
    for x in file:
        if not first_row:
            config.append(x)
        first_row = False


