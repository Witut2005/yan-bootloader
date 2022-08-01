
import csv

config = []

with open('memory.csv') as file: 
    file = csv.reader(file, delimiter=',')

    for x in file:
        config.append(x)

