import os
from collections.abc import Sequence

from matplotlib import pyplot as plt
from matplotlib.figure import Figure
from matplotlib.axes import Axes

from config import *

# 支持中文
plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文标签
plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号


class Base:
    img_id = 0

    def __init__(self):
        Base.img_id += 1
        self.fig: Figure
        self.ax: Axes
        self.fig, self.ax = plt.subplots()
        self.size = [6.3, 3.6]  # 图片大小
        self.img_path = os.path.join(temp_dir, f"img_{Base.img_id}.png")  # 图片保存位置

        self.fig.set_size_inches(*self.size)

    def __del__(self):
        if os.path.exists(self.img_path):
             os.remove(self.img_path)

    def add_axis(self, xaxis: Sequence, yaxis: Sequence):
        self.ax.plot(xaxis, yaxis, self.width)

    def set_xlabel(self, label: str):
        self.ax.set_xlabel(label)

    def set_ylabel(self, label: str):
        self.ax.set_ylabel(label)

    def set_xticks(self, ticks: Sequence, labels: Sequence):
        self.ax.set_xticks(ticks, labels)

    def set_yticks(self, ticks: Sequence, labels: Sequence):
        self.ax.set_yticks(ticks, labels)

    def title(self, title: str):
        self.fig.suptitle(title)

    def set_size_inches(self, width, height):
        self.fig.set_size_inches(width, height)

    def get_image(self) -> str:
        # 保存图片
        self.fig.savefig(self.img_path, dpi=330, transparent=True)
        return self.img_path

    def save(self, path: str):
        self.fig.savefig(path, dpi=330, transparent=True)


class Bar(Base):
    def __init__(self, bar_width=0.5):
        super().__init__()
        self.bar_width = bar_width  # 条形宽度

    def set_bar_width(self, bar_width):
        self.bar_width = bar_width

    def add_axis(self, xaxis: Sequence, yaxis: Sequence):
        self.ax.bar(xaxis, yaxis, width=self.bar_width)


class Scatter(Base):
    def add_axis(self, xaxis: Sequence, yaxis: Sequence):
        self.ax.scatter(xaxis, yaxis)


if __name__ == '__main__':
    data1 = [15, 96, 54, 12]

    test = Scatter()
    test.add_axis(list(range(1, len(data1) + 1)), data1)
    test.set_xlabel("X轴坐标")
    test.set_ylabel("Y轴坐标")
    test.set_xticks([1, 2, 3, 4], ["项1", "项2", "项3", "项4"])
    test.save("figure.png")
