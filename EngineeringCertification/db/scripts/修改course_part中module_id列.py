import pymysql

conn = pymysql.connect(host='localhost',
                       user='root',
                       password='123456',
                       database='graduationdb')

cursor = conn.cursor()

sql = "SELECT * FROM course_part"
cursor.execute(sql)

for row in cursor.fetchall():
    sql = f"SELECT module_id FROM course_module WHERE audit_id='{row[3]}' and name='{row[4]}'"
    cursor.execute(sql)
    module_id = cursor.fetchall()[0][0]
    sql = f"UPDATE course_part SET module_id='{module_id}' WHERE audit_id='{row[3]}' and module_name='{row[4]}'"
    cursor.execute(sql)
    print("插入成功")

conn.commit()
conn.close()
