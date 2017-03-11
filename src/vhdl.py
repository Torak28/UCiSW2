s = "Clock <= '0',"
jedynka = "1"
zero = "0"

fz = 0
fj = 1

def zasieg(start, end, step):
    while start <= end:
        yield start
        start += step

for x in zasieg(10, 5000, 10):
	if (fz == 1):
		s+= "'{}' after {} ns,".format('0', x)
		fz = 0
		fj = 1
	elif (fj == 1):
		s+= "'{}' after {} ns,".format('1', x)
		fz = 1
		fj = 0

print s