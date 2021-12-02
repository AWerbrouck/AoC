import util


def part1():
    data = [d.replace("\n", "") for d in util.read("2021/inputs/2")]
    forwards = [int(d.replace("forward ","")) for d in data if d.startswith("forward")]
    ups = [int(d.replace("up ","")) for d in data if d.startswith("up")]
    downs = [int(d.replace("down ","")) for d in data if d.startswith("down")]
    f = sum(forwards)
    x = sum(downs) - sum(ups)
    return f*x
    


def part2():
    data = [d.replace("\n", "") for d in util.read("2021/inputs/2")]
    x = 0
    y = 0
    a = 0
    for line in data:
        if(line.startswith("forward ")):
            l = int(line.replace("forward ",""))
            x += l
            y += l*a
        elif(line.startswith("down ")):
            l = int(line.replace("down ",""))
            a += l
        elif(line.startswith("up ")):
            l = int(line.replace("up ", ""))
            a -= l
    return x*y