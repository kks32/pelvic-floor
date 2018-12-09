import math
def main():
    for i in range(0, 101):
        E = 1E6    # Pa or N/m^2
        nu = 0.3   #
        r = 0.0575 * (1 + (i/100)) # m
        t = 0.0094 # m
        mass = 8.5 # kg
        area = math.pi * r * r
        pressure = mass * 9.814 / area
        P = 8031.18106 # Pa or N/m^2
        residual_stress = 391.66E3 #Pa

        alpha = E / (1 - nu)

        # ax^3 + bx^2 + cx + d = 0
        a = 8 * t * alpha / (3 * pow(r, 4))
        b = 0
        c = 4 * t * residual_stress / (r * r)
        d = -P

        # Solving for the real values of x in cubic
        D0 = -3 * a * c
        D1 = 27 * a * a * d
        f = pow(((D1 + math.sqrt(D1 * D1 - 4 * pow(D0, 3)))/2), (1/3))
        
        # Solving for deflection
        x = -1 / (3 * a) * (f + D0 / f) * 1000 #mm
        print((1 + (i/100)), x)
        
if __name__ == '__main__':
    main()
