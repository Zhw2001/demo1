import os

from tempfile import TemporaryDirectory

# 项目根目录
proj_root = os.path.dirname(__file__)  # 通过此文件目录获取项目根目录
# 数据文件夹
data_path = proj_root + r"\data"
# 模板文件夹
template_path = proj_root + r"\template"
# 输出文件夹
out_path = proj_root + r"\out"

# 获取临时文件夹
_temp_dir = TemporaryDirectory()
temp_dir = _temp_dir.name

os.chdir(proj_root)
