import time


def get_timestamp():
    """
    :return: 获取当前时间戳 %Y-%m-%d %H:%M:%S %ms.3
    """
    c_time = time.time()
    local_time = time.localtime(c_time)
    time_stamp = time.strftime("%Y-%m-%d-%H-%M-%S")
    msec = c_time - int(c_time)
    return f"{time_stamp} {int(msec * 1000)}"


def dec_to_excel_col(x: int) -> str:
    """
    将十进制数字转化为以大小字母为符号的27进制数字（Excel列号）
    :param x: 十进制数字
    :return: 以大小字母为符号的27进制数字
    """
    map = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
           'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    x -= 1
    if not x // 26:
        return map[x]
    else:
        return dec_to_excel_col(x // 26) + map[x % 26]


if __name__ == '__main__':
    print(get_timestamp())
    print(dec_to_excel_col(26))
    print(dec_to_excel_col(27))
    print(dec_to_excel_col(52))
