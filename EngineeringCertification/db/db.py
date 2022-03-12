import pymysql

conn = pymysql.connect(host='localhost',
                       user='root',
                       password='123456',
                       database='graduationdb')

cursor = conn.cursor()


def get_course_info_by_identifier(identifier: int) -> (str, str):
    """
    使用识别号查找课程信息（课程学期，课程号）
    :param identifier: 课程识别号
    :return: （课程学期，课程号）
    """
    sql = f"""
        SELECT courseinfo.semester, courseinfo.info_cId
        FROM courseinfo WHERE info_cNum='{identifier}'
        """
    cursor.execute(sql)
    return cursor.fetchall()[0]


def get_identifier_by_course_info(semester: str, course_id: str) -> int:
    """
    使用课程信息获取识别号
    :param semester: 课程学期
    :param course_id: 课程号
    :return: 课程识别号
    """
    sql = f"""
        SELECT audit_info.id
        FROM audit_info
        WHERE semester='{semester}' and cid='{course_id}'
    """
    cursor.execute(sql)
    res = cursor.fetchall()
    if len(res) == 0:
        return 0
    else:
        return res[0][0]


def get_modules_structure_by_audit_id(audit_id: int) -> dict[str:int]:
    """
    使用审核识别号获取模组结构
    :param audit_id: 审核识别号
    :return: dict[模组名:模组识别号]
    """
    sql = f"""
        SELECT course_module.name, course_module.module_id
        FROM course_module
        WHERE audit_id='{audit_id}'
        ORDER BY course_module.`index`
    """
    cursor.execute(sql)
    res = {}
    for row in cursor.fetchall():
        res[row[0]] = row[1]
    return res


def get_parts_structure_by_modules_info(modules_info: dict[str:int]):
    """

    :param modules_info:
    :return:
    """
    for module_name, module_id in modules_info.items():
        sql = f"""
            SELECT course_part.name, course_part.part_id
            FROM course_part
            WHERE module_id='{module_id}'
            ORDER BY course_part.`index`
        """
        cursor.execute(sql)
        modules_info[module_name] = {}
        for row in cursor.fetchall():
            modules_info[module_name][row[0]] = row[1]
        if len(modules_info[module_name]) == 1 and \
                list(modules_info[module_name].keys())[0] == module_name:
            modules_info[module_name] = list(module_name[module_name].values())[0]
    return modules_info


def get_items_structure_by_parts_info(modules_info: dict[str:dict[str:int]]):
    """

    :param modules_info:
    :return:
    """
    for module_name, parts_info in modules_info.items():
        if type(parts_info) is int:
            sql = f"""
                SELECT course_item.item_id 
                FROM course_item
                WHERE part_id = '{parts_info}'
            """
            cursor.execute(sql)
            modules_info[module_name] = cursor.fetchall()[0][0]
            continue

        for part_name, part_id in parts_info.items():
            sql = f"""
                SELECT course_item.name,course_item.item_id
                FROM course_item
                WHERE part_id = '{part_id}'
            """
            cursor.execute(sql)
            parts_info[part_name] = {}
            for row in cursor.fetchall():
                parts_info[part_name][row[0]] = row[1]
            if len(parts_info[part_name]) == 1 and \
                    list(parts_info[part_name].keys())[0] == part_name:
                parts_info[part_name] = list(parts_info[part_name].values())[0]
    return modules_info


def get_modules_info_by_audit_id(audit_id: int):
    """

    :param audit_id:
    :return: [(模组名，模组占比，模组识别号)]
    """
    sql = f"""
        SELECT course_module.name, course_part.ratio, course_part.module_id, course_module.`index`
        FROM course_part, course_module
        WHERE course_module.audit_id='{audit_id}' and 
              course_part.module_id=course_module.module_id
    """
    cursor.execute(sql)
    t_res = {}
    for row in cursor.fetchall():
        if (row[0], row[2], row[3]) in t_res.keys():
            t_res[(row[0], row[2], row[3])] += int(row[1])
        else:
            t_res[(row[0], row[2], row[3])] = int(row[1])
    res = [0] * len(t_res)
    for key, value in t_res.items():
        res[key[-1]] = (key[0], value, key[1])
    return res


def get_parts_info_by_item_id(item_id: int) -> list[(str, int, int)]:
    """
    使用 item_id 获取 item 所在 module 的所有 part 的信息
    :param item_id:
    :return: [(单元名, 单元占比, 单元识别号)]
    """
    # 先获取当前 item 所在 module_id
    sql = f"""
        SELECT course_part.module_id
        FROM course_part, course_item
        WHERE course_item.item_id='{item_id}' and
              course_part.part_id=course_item.part_id
    """
    cursor.execute(sql)
    module_id = cursor.fetchone()[0]
    sql = f"""
        SELECT course_part.name, course_part.ratio, course_part.part_id, course_part.`index`
        FROM course_part
        WHERE course_part.module_id='{module_id}'
    """
    cursor.execute(sql)
    fetch = cursor.fetchall()
    res = [0] * len(fetch)
    for row in fetch:
        res[row[3]] = (row[0], row[1], row[2])
    return res


def get_item_info_by_item_id(item_id: int) -> (str, int, int):
    """
    使用 item_id 获取课程小项信息
    :param item_id:
    :return: (课程小项名，课程小项总分，课程小项序号)
    """
    sql = f"""
        SELECT course_item.name, course_item.score, course_item.`index`
        FROM course_item
        WHERE course_item.item_id='{item_id}'
    """
    cursor.execute(sql)
    return cursor.fetchone()


def get_part_info_by_item_id(item_id: int) -> (str, int, int):
    """

    :param item_id:
    :return: （课程单元名，课程单元所占比例，课程单元序号）
    """
    sql = f"""
        SELECT course_part.name, course_part.ratio, course_part.`index`
        FROM course_part, course_item
        WHERE course_item.item_id='{item_id}' and
              course_part.part_id=course_item.part_id 
    """
    cursor.execute(sql)
    return cursor.fetchone()


def get_module_info_by_item_id(item_id: int):
    """

    :param item_id:
    :return: （课程模块名，课程模块占比，课程模块序号）
    """
    sql = f"""
        SELECT course_module.name, course_module.module_id, course_module.`index`
        FROM course_module, course_part, course_item
        WHERE course_item.item_id='{item_id}' and 
              course_part.part_id=course_item.part_id and
              course_module.module_id=course_part.module_id
    """
    cursor.execute(sql)
    res = list(cursor.fetchone())
    sql = f"""
        SELECT course_part.ratio
        FROM course_part
        WHERE course_part.module_id='{res[1]}'
    """
    cursor.execute(sql)
    res[1] = 0
    for row in cursor.fetchall():
        res[1] += row[0]
    return tuple(res)


def get_form_structure_by_audit_di(audit_id: int):
    # todo index 还没有发挥作用
    modules_info = get_modules_structure_by_audit_id(audit_id)
    modules_info = get_parts_structure_by_modules_info(modules_info)
    modules_info = get_items_structure_by_parts_info(modules_info)
    return modules_info


def save_student_info(stu_id: int, stu_name: str, semester: str, course_id: str):
    """
    :param stu_id: 学号
    :param stu_name: 姓名
    :param semester: 学期
    :param course_id: 课程号
    :return:
    """
    sql = f"""
        REPLACE INTO course(sId, sName, sTime, cId)
        VALUES ('{stu_id}', '{stu_name}', '{semester}', '{course_id}')
    """
    cursor.execute(sql)
    conn.commit()


def save_student_infos(student_infos: list[(int, str, str, str)]):
    """
    :param student_infos: [(学号，姓名，学期，课程号）]
    :return:
    """
    values = ",".join([str(tuple(row)) for row in student_infos])
    sql = f"""
        REPLACE INTO course(sId, sName, sTime, cId)
        VALUES {values}
    """
    cursor.execute(sql)
    conn.commit()


def save_item_score(item_id: int, stu_id: int, item_score: float):
    sql = f"""
        REPLACE INTO score_detail(item_id, stu_id, value)
        VALUES ('{item_id}', '{stu_id}', '{item_score}')
    """
    # print(sql.replace(' ', "").replace('\n', ""))
    cursor.execute(sql)
    conn.commit()


def save_item_scores(score_infos: list[(int, int, float)]):
    """
    :param score_infos: [(item_id, 学号, 成绩)]
    :return:
    """
    values = ",".join([str(tuple(row)) for row in score_infos])
    sql = f"""
        REPLACE INTO score_detail(item_id, stu_id, value)
        VALUES {values}
    """
    cursor.execute(sql)
    conn.commit()


def get_all_data_for_item_id(item_id: int) -> dict[int:float]:
    sql = f"""
        SELECT score_detail.stu_id, score_detail.value
        FROM score_detail
        WHERE score_detail.item_id='{item_id}'
    """
    cursor.execute(sql)
    res = {}
    for row in cursor.fetchall():
        res[row[0]] = row[1]
    return res


def get_students_info_by_audit_id(audit_id) -> list[(int, str, str)]:
    """
    :param audit_id:
    :return:（学号，姓名，班级）
    """
    # 先获取一个 item_id 用来在 score_detail 表中查询所有有成绩的学生
    sql = f"""
        SELECT course_item.item_id
        FROM course_module, course_part, course_item
        WHERE course_module.audit_id='{audit_id}' and 
              course_part.module_id=course_module.module_id and
              course_item.part_id=course_part.part_id
    """
    cursor.execute(sql)
    item_id = cursor.fetchone()[0]
    # 再获取所有有成绩学生的学号
    sql = f"""
        SELECT score_detail.stu_id
        FROM score_detail
        WHERE item_id='{item_id}'
    """
    cursor.execute(sql)
    res = []
    for row in cursor.fetchall():
        sql = f"""
            SELECT course.sId, course.sName, course.sClass
            FROM course
            WHERE course.sId='{row[0]}'
        """
        cursor.execute(sql)
        res.append(cursor.fetchone())
    return res


def get_score_info_by_item_id(item_id: int) -> list[(int, float)]:
    """
    :param item_id:
    :return:（学号，成绩）
    """
    sql = f"""
        SELECT score_detail.stu_id, score_detail.value
        FROM score_detail
        WHERE item_id='{item_id}'
    """
    cursor.execute(sql)
    return list(cursor.fetchall())
