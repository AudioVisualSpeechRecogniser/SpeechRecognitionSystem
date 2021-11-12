import os

names = ["Albi", "Alex", "Alexander", "Alejandro", "Aurelie", "Benjamin", "Brennan", "Felipe", "Harry", "Hemal", "Hugo", "Max", "Nathaniel", "Owen", "Ruby", "Rory", "Rauridh", "Sarah", "Sophie", "Vav", "Yan", "sil"]

proto_states = 16

for name in names:
    os.system("HInit -S lists/trainList.txt -l " + name + " -L labels/train -M hmms -o " + name + " -T 1 lib/proto" + str(proto_states) + "States.txt")
