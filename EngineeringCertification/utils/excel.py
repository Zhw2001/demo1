from copy import copy
from collections.abc import Iterable

from pandas import DataFrame

from openpyxl.worksheet.worksheet import Worksheet
import xlsxwriter


def copy_xlcell_style(sheet: Worksheet, rows, cols, src_rows, src_cols) -> Worksheet:
    """
    将指定工作表中，指定区域的单元格样式，设置为另一指定区域的样式
    类似于 Numpy 的索引，cols和rows数组设置目标单元格，一个len(cols)*len(rows)的矩形区域
    src_col和src_rows数组设置源单元格，也是一个len(src_cols)*len(src_rows)的矩形区域
    :param sheet: 指定的工作表
    :param cols: 若为单个整数，则仅表示这一行；若为整数数组，则表示数组中元素的每一行
    :param rows: 若为单个整数，则仅表示这一列；若为整数数组，则表示数组中元素的每一行
    :param src_cols: 与cols同理
    :param src_rows: 与rows同理
    :return: 返回修改完的工作表
    """
    # 预处理，数据对齐等操作
    if not isinstance(rows, list) and not isinstance(rows, Iterable):
        rows = [rows]
    if not isinstance(cols, list) and not isinstance(cols, Iterable):
        cols = [cols]
    if not isinstance(src_rows, list) and not isinstance(src_rows, Iterable):
        src_rows = [src_rows]
    if not isinstance(src_cols, list) and not isinstance(src_cols, Iterable):
        src_cols = [src_cols]
    if len(src_rows) < len(rows):
        src_rows *= len(rows) / len(src_rows) + 1
    if len(src_cols) < len(cols):
        src_cols *= len(cols) / len(src_cols) + 1
    src_rows = src_rows[:len(rows)]
    src_cols = src_cols[:len(cols)]

    # 样式复制
    for row, src_row in zip(rows, src_rows):
        for col, src_col in zip(cols, src_cols):
            sheet[f"{col}{row}"].font = copy(sheet[f"{src_col}{src_row}"].font)
            sheet[f"{col}{row}"].fill = copy(sheet[f"{src_col}{src_row}"].fill)
            sheet[f"{col}{row}"].border = copy(sheet[f"{src_col}{src_row}"].border)
            sheet[f"{col}{row}"].alignment = copy(sheet[f"{src_col}{src_row}"].alignment)
            sheet[f"{col}{row}"].protection = copy(
                sheet[f"{src_col}{src_row}"].protection)

    return sheet


def insert_format(work_book: xlsxwriter.Workbook) -> dict:
    formats = {
        "header_zh": work_book.add_format(),  # 表头中文样式
        "zebra_white_zh": work_book.add_format(),  # 表格中文内容浅色底
        "zebra_black_zh": work_book.add_format(),  # 表格中文内容深色底
        "zebra_white_num": work_book.add_format(),  # 表格数字内容浅色底
        "zebra_black_num": work_book.add_format()  # 表格数字内容深色底
    }

    # 编辑表格样式
    formats["header_zh"].set_font_size(12)
    formats["header_zh"].set_bold(True)
    formats["header_zh"].set_border(2)
    formats["header_zh"].set_border_color("#808080")
    formats["header_zh"].set_font_name("宋体")
    formats["header_zh"].set_bg_color("#F5F5F5")
    formats["header_zh"].set_align("center")
    formats["header_zh"].set_align("vcenter")

    formats["zebra_white_zh"].set_font_size(12)
    formats["zebra_white_zh"].set_font_name("黑体")
    formats["zebra_white_zh"].set_border(2)
    formats["zebra_white_zh"].set_border_color("#4682B4")
    formats["zebra_white_zh"].set_align("center")
    formats["zebra_white_zh"].set_align("vcenter")

    formats["zebra_black_zh"].set_font_size(12)
    formats["zebra_black_zh"].set_font_name("黑体")
    formats["zebra_black_zh"].set_border(2)
    formats["zebra_black_zh"].set_border_color("#4682B4")
    formats["zebra_black_zh"].set_bg_color("#DCDCDC")
    formats["zebra_black_zh"].set_align("center")
    formats["zebra_black_zh"].set_align("vcenter")

    formats["zebra_white_num"].set_font_size(12)
    formats["zebra_white_num"].set_font_name("Times New Roman")
    formats["zebra_white_num"].set_num_format("#0")
    formats["zebra_white_num"].set_border(2)
    formats["zebra_white_num"].set_border_color("#4682B4")
    formats["zebra_white_num"].set_align("center")
    formats["zebra_white_num"].set_align("vcenter")

    formats["zebra_black_num"].set_font_size(12)
    formats["zebra_black_num"].set_font_name("Times New Roman")
    formats["zebra_black_num"].set_num_format("#0")
    formats["zebra_black_num"].set_border(2)
    formats["zebra_black_num"].set_border_color("#4682B4")
    formats["zebra_black_num"].set_bg_color("#DCDCDC")
    formats["zebra_black_num"].set_align("center")
    formats["zebra_black_num"].set_align("vcenter")

    return formats


def write_data(work_sheet: xlsxwriter.workbook.Worksheet,
               formats: dict, data: DataFrame):
    """
    :param work_sheet: 要写入数据的工作表对象
    :param formats: 样式
    :param data: 数据
    :return:
    """
    # 加入数据样例
    for j, row in enumerate(data.columns.tolist()):
        for i, value in enumerate(data[row]):
            if value == "":
                continue
            elif i % 2 and j < 3:
                if type(value) is int:
                    work_sheet.write_number(i + 1, j, value,
                                            formats["zebra_black_num"])
                elif type(value) is str and value[0] == '=':
                    work_sheet.write_formula(i + 1, j,
                                             value.replace("%ROW%", str(i + 2)),
                                             formats["zebra_black_zh"])
                else:
                    work_sheet.write(i + 1, j, value, formats["zebra_black_zh"])
            else:
                if type(value) is int:
                    work_sheet.write_number(i + 1, j, value,
                                            formats["zebra_white_num"])
                elif type(value) is str and value[0] == '=':
                    work_sheet.write_formula(i + 1, j,
                                             value.replace("%ROW%", str(i + 2)),
                                             formats["zebra_white_zh"])
                else:
                    work_sheet.write(i + 1, j, value, formats["zebra_white_zh"])
