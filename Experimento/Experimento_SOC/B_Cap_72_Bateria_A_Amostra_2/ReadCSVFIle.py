import csv
import pandas
from ClassSample import Sample

list_sample = []

line_count = 0
with open('Bat_A_72_Amostra_2_84.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter = ',')
    line_count = 0
    for row in csv_reader:
        sample = Sample(row[0], row[1], row[2], row[3], row[4])
        list_sample.append(sample)
        print('Estado de carga:' + row[4])
        line_count += 1

print('Linhas processadas : ' + str(line_count))


