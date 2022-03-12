import os
import shutil


def log(*args, **kwargs):
    # 清空log文件夹
    if os.path.exists("./log"):
        shutil.rmtree("./log")
    os.mkdir("./log")

    for arg in args:
        if type(arg) in [int, float, str, list, tuple, dict]:
            with open("./log/log.txt", "w+") as file:
                file.write(str(arg) + "\n")

    with open("./log/log.txt", "w+") as file:
        file.write(str(kwargs) + "\n")
