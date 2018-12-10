# A new analytical solution for diaphragm deflection and its application to a Surface-Micromachined
# pressure sensor https://www.sandia.gov/mstc/_assets/documents/bibliography/5_1New.pdf
import math
import csv

def main():
    data = [["r", "deflection"]]
    x0 = 0
    for i in range(0, 101):
        scaling = (1 + (i/100))
        E = 10E6   # Pa or N/m^2
        nu = 0.43  #
        r = 0.0575 * scaling # m
        t = 0.00715 * scaling # m #if (0.00715 * scaling) < 0.00748 else 0.00748# m
        mass = 8.5 # kg
        area = math.pi * r * r
        # pressure = mass * 9.814 / area
        # pressure = (0.20 * 0.20 * 0.15 * 1416.782808612) * pow(scaling, 3) * 9.814 / area
        pressure = 8031.18106 * scaling # Pa or N/m^2

        alpha = E / (1 - nu)

        # ax^3 + bx^2 + cx + d = 0
        a = 2 * E * t * (1 + nu) * (23 - 9 * nu) / (63 * r * r * (1 - (nu * nu)))
        b = 0
        c = 16 * E * pow(t, 3) / (9 * r * r * (1 - (nu * nu)))
        d = -pressure * r * r / 3

        # Generic real value solution of x in a cubic equation
        # for b = 0
        D0 = -3 * a * c
        D1 = 27 * a * a * d
        f = pow(((D1 + math.sqrt(D1 * D1 - 4 * pow(D0, 3)))/2), (1/3))

        # Solving for deflection
        x = -1 / (3 * a) * (f + D0 / f) * 1000 #mm
        print(x)
        if i == 0:
            x0 = x

        xdiff = (x - x0)/x0 * 100
        data.append([i, xdiff])

    csvfile = open('effect-r.csv', 'w')
    with csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(data)

        
if __name__ == '__main__':
    main()
