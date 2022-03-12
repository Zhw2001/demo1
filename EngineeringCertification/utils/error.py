class ProportionError(Exception):
    """百分比加起来不等于100%"""
    pass


class FormatError(Exception):
    """格式错误"""
    pass


class GradeMatchError(Exception):
    """设置的年级发生错误"""
    pass


class DataNotExistError(Exception):
    """读取数据时数据不存在"""
    pass
