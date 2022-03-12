# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import random
import sys


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    fact = 1
    for i in range(1, 10000):
        fact *= i
        cnt = 0
        t_fact = fact
        while not t_fact % 10:
            t_fact //= 10
            cnt += 1
        print(f"{i} {cnt}")
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
