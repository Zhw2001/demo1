import os
import sys

import flask
from flask import Flask, request, abort

from word import exam_audit, course_degree
from excel.evaluation import ExcelBuilder
from excel.detail import DetailProcessor

from utils.sever import *

app = Flask(__name__,
            static_folder="sever/pages",
            static_url_path="/pages")


@app.route("/upload_score", methods=["POST"])
def upload_score():
    """
    在传入的 Excel 表中添加图表并返回
    将传入的 Excel 表中所有的成绩信息存入数据库
    :return:
    """
    file = request.files["file"]
    detail_processor: DetailProcessor = DetailProcessor()
    detail_processor.set_receive_file(file)
    if "audit_id" in request.form.keys():
        detail_processor.set_audit_id(int(request.form.get("audit_id")))
    elif "semester" in request.form.keys() and "course_id" in request.form.keys():
        detail_processor.set_semester(str(request.form.get("semester")))
        detail_processor.set_course_id(str(request.form.get("course_id")))
    else:
        abort(404)
    detail_processor.upload_data()
    return "done"


@app.route("/download_score", methods=["GET"])
def get_score_detail():
    """
    根据给出的课程信息生成课程成绩明细表
    :return:
    """
    detail_processor: DetailProcessor = DetailProcessor()
    if "audit_id" in request.form.keys():
        detail_processor.set_audit_id(int(request.form.get("audit_id")))
    elif "semester" in request.form.keys() and "course_id" in request.form.keys():
        detail_processor.set_semester(str(request.form.get("semester")))
        detail_processor.set_course_id(str(request.form.get("course_id")))
    else:
        abort(404)
    file_name = detail_processor.get_score_file()
    return flask.send_file(file_name, as_attachment=True)


@app.route("/detail_template", methods=["GET"])
def get_detail_template():
    """
    根据课程号和学期获取课程明细表的模板
    :return:
    """
    detail_processor: DetailProcessor = DetailProcessor()
    if "audit_id" in request.form.keys():
        detail_processor.set_audit_id(int(request.form.get("audit_id")))
    elif "semester" in request.form.keys() and "course_id" in request.form.keys():
        detail_processor.set_semester(str(request.form.get("semester")))
        detail_processor.set_course_id(str(request.form.get("course_id")))
    else:
        abort(404)
    file_name = detail_processor.get_template()
    return flask.send_file(file_name, as_attachment=True)


@app.route("/evaluation", methods=["GET"])
def get_evaluation():
    """
    获取课程目标达成评价 API
    :return: 给客户端发送 Excel 文件
    """
    number: int = int(request.args.get("number"))
    log(number=number)
    excel_builder: ExcelBuilder = ExcelBuilder()
    file_name: str = excel_builder.get_file(number)
    return flask.send_file(file_name, as_attachment=True)


@app.route("/degree", methods=["POST"])
def get_course_degree():
    """
    获取课程教学目标达成度评价 API
    :return:
    """
    data = request.get_json()
    log(data=data)
    docx_builder = course_degree.DocxBuilder()
    docx_builder.parse_dict(data)
    docx_builder.generate_auto_data()  # todo
    file_name = docx_builder.get_file()
    return flask.send_file(file_name, as_attachment=True)


@app.route("/audit", methods=["POST"])
def get_exam_audit():
    """
    获取考核内容合理性审核 API
    :return:
    """
    data = request.get_json()
    log(data=data)
    docx_builder = exam_audit.DocxBuilder()
    docx_builder.parse_dict(data)
    docx_builder.generate_auto_data()  # todo
    file_name = docx_builder.get_file()
    return flask.send_file(file_name, as_attachment=True)


if __name__ == '__main__':
    app.run(debug=True)
