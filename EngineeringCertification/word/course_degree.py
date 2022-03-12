import os
import json

from docxtpl import DocxTemplate, InlineImage
from docx.shared import Cm
import numpy as np

from utils.utils import *
from word.chart import *


class CourseGoal:
    def __init__(self):
        self.sup_grad_req: str = ""  # 支撑毕业要求
        self.point: str = ""  # 观测点
        self.score: int = 0  # 总分
        self.expectation: int = 0  # 期望值
        self.practical: int = 0  # 实际值
        self.degree: int = 0  # 达成度
        self.description: str = ""  # 描述
        self.analysis: str = ""  # 达成度分析

    def set_support_graduation_require(self, sup_grad_req: str):
        self.sup_grad_req = sup_grad_req

    def set_point(self, point: str):
        self.point = point

    def set_score(self, score: int):
        self.score = score

    def set_expectation(self, expectation: int):
        self.expectation = expectation

    def set_practical(self, practical: int):
        self.practical = practical

    def set_degree(self, degree: int):
        self.degree = degree

    def set_description(self, description: str):
        self.description = description

    def set_analysis(self, analysis: str):
        self.analysis = analysis


class CourseDegreeDocxData:
    """用来储存文档中的可变数据"""

    def __init__(self):
        self.semester: str = ""  # 评价学期
        self.date: str = ""  # 评价时间
        self.course_name: str = ""  # 课程名
        self.exam_type: str = ""  # 课程性质
        self.classes: str = ""  # 评价班级
        self.exam_date: str = ""  # 考试时间
        self.exam_mode: str = ""  # 考核方式
        self.textbook: str = ""  # 教材信息
        self.standard: list[str] = []  # 评分标准
        self.need_exam: int = 0  # 应考人数
        self.miss_exam: int = 0  # 缺考人数
        self.course_goals: list[CourseGoal] = []  # 课程目标们
        self.appraiser: str = ""  # 评价人

    def set_semester(self, semester: str):
        self.semester = semester

    def set_date(self, date: str):
        self.date = date

    def set_course_name(self, course_name: str):
        self.course_name = course_name

    def set_exam_type(self, exam_type: str):
        self.exam_type = exam_type

    def set_classes(self, classes: str):
        self.classes = classes

    def set_exam_date(self, exam_date: str):
        self.exam_date = exam_date

    def set_exam_mode(self, exam_mode: str):
        self.exam_mode = exam_mode

    def set_textbook(self, textbook: str):
        self.textbook = textbook

    def set_standard(self, standard: list[str]):
        self.standard = standard

    def set_need_exam(self, need_exam: int):
        self.need_exam = need_exam

    def set_miss_exam(self, miss_exam: int):
        self.miss_exam = miss_exam

    def add_course_goals(self, course_goal: CourseGoal):
        self.course_goals.append(course_goal)

    def set_course_goals(self, course_goals: list[CourseGoal]):
        self.course_goals = course_goals

    def set_appraiser(self, appraiser: str):
        self.appraiser = appraiser


class DocxBuilder:
    file_path_ = os.path.join(out_path, "word", "course_degree.docx")

    def __init__(self):
        # 输出目录
        self.file_path: str = DocxBuilder.file_path_
        # 读取 Word 模板
        self.docx_file: DocxTemplate = DocxTemplate(
            template_path + "\\course_degree.docx")
        # 模板渲染数据
        self.context: dict = {}
        # 手工输入数据
        self.data: CourseDegreeDocxData = CourseDegreeDocxData()
        # 图表数据
        self.polt_data: list[Base] = []  # 第一个是总的，后面跟个别的

    def __del__(self):
        if os.path.dirname(self.file_path) != temp_dir:
            return
        if os.path.exists(self.file_path):
            os.remove(self.file_path)

    def parse_json(self, json_data: str):
        dict_data = json.loads(json_data)
        self.parse_dict(dict_data)

    def parse_dict(self, dict_data: dict):
        self.data.set_semester(dict_data["semester"])
        self.data.set_date(dict_data["date"])
        self.data.set_course_name(dict_data["course_name"])
        self.data.set_exam_type(dict_data["exam_type"])
        self.data.set_classes(dict_data["classes"])
        self.data.set_exam_mode(dict_data["exam_mode"])
        self.data.set_textbook(dict_data["textbook"])
        self.data.set_standard(dict_data["standard"])
        self.data.set_need_exam(dict_data["need_exam"])
        self.data.set_miss_exam(dict_data["miss_exam"])
        self.data.set_appraiser(dict_data["appraiser"])

        for data in dict_data["course_goals"]:
            course_goal = CourseGoal()
            course_goal.set_support_graduation_require(
                data["support_graduation_require"])
            course_goal.set_point(data["point"])
            course_goal.set_score(data["score"])
            course_goal.set_expectation(data["expectation"])
            course_goal.set_degree(data["degree"])
            course_goal.set_description(data["description"])
            course_goal.set_analysis(data["analysis"])
            self.data.add_course_goals(course_goal)

    def set_manual_data(self):
        """设置人工填写的数据"""
        self.data.semester = "xxxx-xxxx-x"
        self.data.date = "xxxx年xx月"
        self.data.course_name = "课程名"
        self.data.exam_type = "课程性质"
        self.data.classes = "评价班级xxx,xxx"
        self.data.exam_date = "xxxx.xx.xx"
        self.data.exam_mode = "考核方式1\n" + \
                              "考核方式2"
        self.data.textbook = "教材信息"
        self.data.standard = ["优秀评分标准",
                              "良好评分标准",
                              "及格评分标准",
                              "不及格评分标准"]
        self.data.need_exam = 100
        self.data.miss_exam = 2

        data1 = [35, 20, 22.4, 22.6]
        data2 = [22, 16, 10, 12]
        data3 = [0.93, 0.91, 0.89, 0.76]
        for i in range(1, 5):
            course_goal = CourseGoal()
            course_goal.sup_grad_req = f"毕业要求{i}.{i}"
            course_goal.point = f"观测点1"
            course_goal.score = data1[i - 1]
            course_goal.expectation = data2[i - 1]
            course_goal.degree = data3[i - 1]
            course_goal.description = f"课程目标{i}描述"
            course_goal.analysis = f"课程目标{i}分析"
            self.data.course_goals.append(course_goal)

        self.data.appraiser = "评价人"

    def generate_auto_data(self):
        """生成自动获取的数据"""
        # todo
        # 通过数据库查询等操作获取自动生成的数据
        # 获取自动生成的信息
        data1 = [0.97, 0.93, 0.95, 0.90]
        data2 = [
            [32.6, 7.0, 0.0, 30.8, 32.2, 32.9, 35.0, 31.5, 27.0, 32.9, 33.6, 35.0, 30.1],
            [17.4, 0.0, 0.0, 19.6, 19.8, 17.4, 19.1, 17.6, 17.4, 18.0, 18.6, 16.9, 18.6],
            [12.6, 5.3, 0.0, 17.5, 19.3, 19.6, 19.3, 16.8, 15.1, 16.5, 16.8, 17.2, 16.8],
            [10.7, 3.2, 0.0, 21.8, 19.1, 19.5, 21.1, 19.9, 22.7, 16.0, 16.9, 18.0, 21.3]
        ]

        bar: Bar = Bar()
        bar.set_xticks(list(range(1, 5)), [f"课程目标{i}" for i in range(1, 5)])
        bar.set_yticks(np.linspace(0, 1, 5),
                       [f"{i * 100}%" for i in np.linspace(0, 1, 5)])
        bar.add_axis(list(range(1, 5)), data1)
        bar.set_ylabel("目标达成度")
        bar.title(f"{self.data.semester}学期{self.data.course_name}课程目标达成度")
        self.polt_data.append(bar)

        for i, goal in enumerate(self.data.course_goals):
            scatter: Scatter = Scatter()
            scatter.add_axis(list(range(1, len(data2[0]) + 1)), data2[i])
            scatter.set_xlabel("学生编号")
            scatter.set_ylabel("目标达成度")
            scatter.title(f"“课程目标{i + 1}”的成绩分布")
            self.polt_data.append(scatter)

    def create_docx_file(self,
                         file_path=os.path.join(out_path, "word", "course_degree.docx")):
        if os.path.exists(self.file_path):
            os.remove(self.file_path)
        self.file_path = file_path

        # 表1 课程基本信息
        self.context["semester"] = self.data.semester
        self.context["date"] = self.data.date
        self.context["name"] = self.data.course_name
        self.context["type"] = self.data.exam_type
        self.context["classes"] = self.data.classes
        self.context["exam_date"] = self.data.exam_date
        self.context["exam_mode"] = self.data.exam_mode
        self.context["textbook"] = self.data.textbook

        # 表2 评分标准
        self.context["standard"] = self.data.standard

        # 表3 课程达成度评价
        self.context["need_exam"] = self.data.need_exam
        self.context["miss_exam"] = self.data.miss_exam

        detail: list[list[str]] = []
        for goal in self.data.course_goals:
            row = [goal.sup_grad_req, goal.point, goal.score, goal.expectation,
                   goal.degree]
            detail.append(row)
        self.context["detail"] = detail

        # 分析部分
        image = InlineImage(
            self.docx_file,
            image_descriptor=self.polt_data[0].get_image(),
            width=Cm(14), height=Cm(8)
        )
        self.context["tot_chart"] = image

        each_analysis = []
        for i, goal in enumerate(self.data.course_goals):
            image = InlineImage(
                self.docx_file,
                image_descriptor=self.polt_data[i + 1].get_image(),
                width=Cm(14), height=Cm(8)
            )
            row = [goal.description, image, goal.analysis]
            each_analysis.append(row)
        self.context["each_analysis"] = each_analysis

        # 结尾
        self.context["appraiser"] = self.data.appraiser

        # print("file path:" + file_path)
        self.docx_file.render(self.context)
        self.docx_file.save(file_path)

    def get_file(self):
        # 为文件打上时间戳，避免访问冲突
        timestamp = get_timestamp().replace(' ', '_')
        file_path = os.path.join(temp_dir, f"course_degree_{timestamp}.docx")
        self.create_docx_file(file_path)
        return file_path


if __name__ == '__main__':
    main_docx: DocxBuilder = DocxBuilder()
    main_docx.create_docx_file()
