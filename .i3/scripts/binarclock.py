#! /usr/bin/python3
import time
from itertools import zip_longest


def main():
    # print(vertical_strings(bcd(time.strftime('%H%M%S'))).replace('1', '${color4}◉${color}').replace('0', '○').replace('2', '${color2}◉${color}').replace('3', '${color7}◉${color}'))
    print(vertical_strings(bcd(time.strftime('%H%M%S'))).replace('1', '${color4}◍${color}').replace('0', '○').replace('2', '${color2}◍${color}').replace('3', '${color7}◍${color}'))

def bcd(digits):
    def bcdigit(d):
        # [2:] strips the '0b' prefix added by bin().
        return bin(d)[2:].rjust(4, '0')
    return (bcdigit(int(d)) for d in digits)

def vertical_strings(strings):
    i = 0
    new = []
    for s in strings:
        if i>1:
            if i<4:
                new.append(s.replace('1', '2'))
            else:
                new.append(s.replace('1', '3'))
        else:
            new.append(s)
        i+=1
    # TODO: EN CADA PAR DE COLS REEMPLAZAR 1 POR ALGUN OTRO NUMERO
    #Orient an iterable of strings vertically: one string per column.'
    iters = [iter(s) for s in new]
    concat = ' '.join
    return '\n'.join(map(concat, zip_longest(*iters, fillvalue=' ')))


if __name__ == '__main__':
    main()
