# coding=utf8

import time
import build.demo as demo

def func():
    for i in range(99999):
        print(demo.addx(i, i**2))
        time.sleep(1)


def main():
    func()


if __name__ == "__main__":
    main()
