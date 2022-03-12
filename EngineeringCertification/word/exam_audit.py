import os
from copy import copy
import json

from docxtpl import DocxTemplate
from collections.abc import Sequence

from utils.utils import *
from utils.error import *
from word.chart import *


class CourseGoal:
    def __init__(self, description: str = "",
                 sup_grad_req: str = "",
                 modules: dict[str:int] = None,
                 evaluation_and_proportion: dict = None,
                 standard: list[str] = None):
        if evaluation_and_proportion and evaluation_and_proportion is not dict:
            raise TypeError(
                f"evaluation_and_proportion only accept dict, not {type(evaluation_and_proportion)}")
        if standard and len(standard) != 4:
            raise TypeError(f"standard should be a list with length=4.")
        self.description: str = description  # 课程目标描述
        self.sup_grad_req: str = sup_grad_req  # 支撑毕业要求
        self.modules: dict[str:list] = modules  # 考核方式各部分
        self.standard: list[str] = standard  # 考核标准

    def check_data(self):
        """检查信息是否正确完整"""
        if not self.description:
            raise ValueError("Missing description.")
        if not self.sup_grad_req:
            raise ValueError("Missing supported graduation requires.")

        if not self.modules:
            raise ValueError("Missing evaluation modules.")
        for key, value in self.modules.items():
            if not value:
                raise ValueError(f"Missing evaluations for {key} module ")
            if type(value) is not dict:
                raise TypeError(f"The type of module {key} should be a dictionary")
            for key1, value1 in value.items():
                if type(value1) not in [int, float]:
                    if not value1.has_key("proportion"):
                        raise FormatError(
                            f"The evaluation {key1} in module {key} missing attribute proportion")
                    if not value1.has_key("content"):
                        raise FormatError(
                            f"The evaluation {key1} in module {key} missing attribute content")

        if not self.standard:
            raise ValueError("Missing evaluation standard.")

    def set_description(self, description: str):
        self.description = description

    def set_support_graduation_require(self, sup_grad_req: str):
        self.sup_grad_req = sup_grad_req

    def set_modules(self, modules: dict[str:list[str]]):
        self.modules = modules

    def add_module(self, module_name: str, evaluations: list[str]):
        if module_name in self.modules.keys():
            raise KeyError("A module with the same name already exists.")
        self.modules[module_name] = evaluations

    def set_evaluations(self, module_name: str, evaluations: list[str]):
        self.modules[module_name] = evaluations

    def add_evaluation(self, module_name: str, evaluation: str):
        self.modules[module_name].append(evaluation)

    def set_standard(self, standard):
        self.standard = standard


class ExamAuditDocxData:
    def __init__(self):
        self.semester: str = ""  # 例如：2018-2019-2
        self.date: str = ""  # 审核时间
        self.course_name: str = ""  # 课程名
        self.course_number: str = ""  # 课程号
        self.classes: str = ""  # 班级
        self.exam_type: str = ""  # 考试/考察
        self.course_goals: list[CourseGoal] = []  # 课程目标们
        self.question_specification: list = [  # 命题规范
            True,  # 命题内容是否符合课程大纲
            True,  # 命题难度是否符合教学实际
            True,  # 题型结构是否符合多样化要求
            True,  # 题量是否符合考核时间要求
            True,  # 题意、用词、符号、图形是否规范
            True,  # AB卷是否不雷同，且难度相同、题量相当
            True,  # 与上一届试卷的重复度是否低于30 %
            0.9,  # 期望通过考试的学生比例
        ]
        self.question_setter: str = ""  # 命题人
        self.question_reviewer: str = ""  # 审核人

    def check_data(self):
        """检测数据格式是否正确完整"""
        if not self.semester:
            raise ValueError("Missing semester.")
        if not self.date:
            raise ValueError("Missing date.")
        if not self.course_name:
            raise ValueError("Missing course name.")
        if not self.course_number:
            raise ValueError("Missing course number.")
        if not self.exam_type:
            raise ValueError("Missing exam type.")
        if not self.question_specification:
            raise ValueError("Missing question specification.")
        if not self.question_setter:
            raise ValueError("Missing question setter.")
        if not self.question_reviewer:
            raise ValueError("Missing question reviewer.")
        if not self.course_goals:
            raise ValueError("Missing course goals.")
        for goal in self.course_goals:
            goal.check_data()
            if goal.modules.keys() != self.course_goals[0].modules.keys():
                raise FormatError(
                    "Different evaluation modules for course goals.")
            for key, value in goal.modules:
                if value.keys() != self.course_goals[0].modules[key].keys():
                    raise FormatError(
                        f"Different evaluations in module {key} for course goals.")

    def set_semester(self, semester: str):
        self.semester = semester

    def set_date(self, date: str):
        self.date = date

    def set_course_name(self, course_name: str):
        self.course_name = course_name

    def set_course_number(self, course_number: str):
        self.course_number = course_number

    def set_classes(self, classes: str):
        self.classes = classes

    def set_exam_type(self, exam_type: str):
        if exam_type not in ["考试", "考核"]:
            raise ValueError("The value of exam_type should be in 考试 or 考核.")
        self.exam_type = exam_type

    def set_question_specification(self, question_specification: list):
        if type(question_specification) is not list:
            raise TypeError("question specification need to be a Sequence.")
        if len(question_specification) != 8:
            raise FormatError("The length of question specification need to be 8.")
        for i in question_specification[:7]:
            if type(i) != bool:
                raise FormatError("Wrong format of question specification.")
        if type(question_specification[-1]) != int:
            raise FormatError("Wrong format of question specification.")
        self.question_specification = question_specification

    def set_question_setter(self, question_setter: str):
        self.question_setter = question_setter

    def set_question_reviewer(self, question_reviewer: str):
        self.question_reviewer = question_reviewer

    def add_course_goal(self, course_goal: CourseGoal):
        self.course_goals.append(course_goal)


class DocxBuilder:
    def __init__(self):
        self.file_path = os.path.join(out_path, "word", "exam_audit.docx")
        # 读取 Word 模板
        self.docx_file: DocxTemplate = DocxTemplate(template_path + "\\exam_audit.docx")
        # 渲染模板的变量
        self.context: dict = {}
        # 手工输入数据
        self.data: ExamAuditDocxData = ExamAuditDocxData()

    def __del__(self):
        if os.path.dirname(self.file_path) == temp_dir:
            return
        if os.path.exists(self.file_path):
            os.remove(self.file_path)

    def check_data(self):
        if not self.data:
            raise ValueError("Missing data.")
        self.data.check_data()

    def parse_json(self, json_data: str):
        dict_data: dict = json.loads(json_data)
        self.parse_dict(dict_data)

    def parse_dict(self, dict_data: dict):
        self.data.set_semester(dict_data["semester"])
        self.data.set_date(dict_data["date"])
        self.data.set_course_name(dict_data["course_name"])
        self.data.set_course_number(dict_data["course_number"])
        self.data.set_classes(dict_data["classes"])
        self.data.set_exam_type(dict_data["exam_type"])
        self.data.set_question_setter(dict_data["question_setter"])
        self.data.set_question_reviewer(dict_data["question_reviewer"])

        for data in dict_data["course_goals"]:
            course_goal = CourseGoal()
            course_goal.set_description(data["description"])
            course_goal.set_support_graduation_require(
                data["support_graduation_require"])
            course_goal.set_modules(data["modules"])
            course_goal.set_evaluation_distribution(data["evaluation_distribution"])
            course_goal.set_standard(data["standard"])
            course_goal.set_exam_question(data["exam_question"])
            course_goal.set_exam_proportion(data["exam_proportion"])
            self.data.course_goals.append(course_goal)

        question_specification = dict_data["question_specification"]
        for i, value in enumerate(question_specification[:7]):
            value = str(value)
            if value == '1' or value.lower() == "true":
                question_specification[i] = True
            elif value == '0' or value.lower() == "false":
                question_specification[i] = False
            else:
                raise FormatError("The data format in question specification is wrong." +
                                  "Witch should be true or false, 1 or 0.")
        question_specification[-1] = int(question_specification[-1])
        self.data.set_question_specification(question_specification)

    def set_manual_data(self):
        self.data.semester = "xxxx-xxxx-x"
        self.data.date = "xxxx年xx月"
        self.data.course_name = "课程名称"
        self.data.course_number = "XX000000"
        self.data.classes = "信管xxx，xxx"
        self.data.exam_type = "考试"

        data1 = [
            [7, 0, 0, 28],
            [0, 8, 12, 0],
            [0, 0, 0, 21],
            [0, 0, 3, 21], ]
        data2 = [35, 20, 22.4, 22.6]
        for i in range(1, 5):
            course_goal = CourseGoal()
            course_goal.description = f"课程目标{i}描述"
            course_goal.sup_grad_req = f"支撑毕业要求{i}.{i}"
            course_goal.usual_evaluations = ["考勤", "课堂表现", "作业"]
            course_goal.end_evaluations = ["卷面考试"]
            course_goal.evaluation_distribution = {"考勤": data1[i - 1][0],
                                                   "课堂表现": data1[i - 1][1],
                                                   "作业": data1[i - 1][2],
                                                   "卷面考试": data1[i - 1][3]}
            course_goal.standard = [f"课程目标{i}优秀评分标准描述",
                                    f"课程目标{i}良好评分标准描述",
                                    f"课程目标{i}及格评分标准描述",
                                    f"课程目标{i}不及格评分标准描述", ]
            course_goal.exam_question = f"对应题目{i}"
            course_goal.exam_proportion = data2[i - 1]
            self.data.course_goals.append(course_goal)

        self.data.question_specification = [
            True,
            True,
            True,
            True,
            False,
            True,
            True,
            90,
        ]
        self.data.question_setter = "命题人"
        self.data.question_reviewer = "审核人"

    def generate_auto_data(self):
        pass

    def create_docx_file(self,
                         file_path=os.path.join(out_path, "word", "exam_audit.docx")):
        if os.path.exists(self.file_path):
            os.remove(self.file_path)
        self.file_path = file_path

        # 表1 课程基本信息
        self.context["semester"] = self.data.semester
        self.context["date"] = self.data.date
        self.context["name"] = self.data.course_name
        self.context["number"] = self.data.course_number
        self.context["classes"] = self.data.classes
        self.context["exam_type"] = self.data.exam_type

        # 表2 考核内容
        course_goals = []
        for goal in self.data.course_goals:
            course_goals.append(goal.description)
        self.context["course_goals"] = course_goals

        # 表3 考核比例
        evaluation_usual = [copy(self.data.course_goals[0].usual_evaluations), []]
        evaluation_end = [copy(self.data.course_goals[0].end_evaluations), []]
        sum_usual = 0
        sum_end = 0
        for name in evaluation_usual[0]:
            s = 0
            for goal in self.data.course_goals:
                s += goal.evaluation_distribution[name]
            sum_usual += s
            evaluation_usual[1].append(str(s))
        for name in evaluation_end[0]:
            s = 0
            for goal in self.data.course_goals:
                s += goal.evaluation_distribution[name]
            sum_end += s
            evaluation_end[1].append(str(s))
        max_len = max(len(evaluation_usual[0]), len(evaluation_end[0]))
        for _ in range(len(evaluation_usual[0]), max_len):
            evaluation_usual[0].append("")
            evaluation_usual[1].append("")
        for _ in range(len(evaluation_end[0]), max_len):
            evaluation_end[0].append("")
            evaluation_end[1].append("")
        self.context["inspection_proportion_usual"] = evaluation_usual
        self.context["sum_usual"] = sum_usual
        self.context["inspection_proportion_end"] = evaluation_end
        self.context["sum_end"] = sum_end

        # 表4 内容分布
        evaluate_ways = self.data.course_goals[0].usual_evaluations + \
                        self.data.course_goals[0].end_evaluations
        sum_ways = [0] * len(evaluate_ways)
        detail = []
        for goal in self.data.course_goals:
            row = list()
            row.append(goal.sup_grad_req)
            for i, name in enumerate(evaluate_ways):
                row.append(goal.evaluation_distribution[name])
                sum_ways[i] += goal.evaluation_distribution[name]
            row.append(sum(goal.evaluation_distribution.values()))
            detail.append(row)
        self.context["evaluate_ways"] = evaluate_ways
        self.context["sum_ways"] = sum_ways
        self.context["detail"] = detail
        ways_for_goal = []
        for i, row in enumerate(detail):
            tot = ""
            for j, way in enumerate(row[1:5]):
                if way > 0:
                    if tot != "":
                        tot += "、"
                    tot += evaluate_ways[j]
            ways_for_goal.append(tot)
        self.context["ways_for_goal"] = ways_for_goal
        self.context["exam_question"] = [goal.exam_question for goal in
                                         self.data.course_goals]
        self.context["exam_proportion"] = [goal.exam_proportion for goal in
                                           self.data.course_goals]

        # 表5 评分标准
        standard = [goal.standard for goal in self.data.course_goals]
        self.context["standard"] = standard

        # 表6 命题规范
        question_specification = self.data.question_specification
        for i, item in enumerate(question_specification[:-1]):
            question_specification[i] = "√" if item else "×"
        self.context["question_specification"] = question_specification

        # 末尾
        self.context["question_setter"] = self.data.question_setter
        self.context["reviewer"] = self.data.question_reviewer

        # 生成文件
        # print("file path:" + file_path)
        self.docx_file.render(self.context)
        self.docx_file.save(file_path)

    def get_file(self):
        # 为文件打上时间戳，避免访问冲突
        timestamp = get_timestamp().replace(' ', '_')
        path = os.path.join(temp_dir, f"exam_audit_{timestamp}.docx")
        self.create_docx_file(file_path=path)
        return path


if __name__ == '__main__':
    main_docx = DocxBuilder()
    main_docx.create_docx_file()
