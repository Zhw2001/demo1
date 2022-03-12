import pymysql

conn = pymysql.connect(host='localhost',
                       user='root',
                       password='123456',
                       database='graduationdb')

cursor = conn.cursor()

sql = "SELECT * FROM course_item"
cursor.execute(sql)

sql = f"""UPDATE course_item,course_part
          SET course_item.part_id=course_part.part_id 
          WHERE course_item.name=course_part.name"""
cursor.execute(sql)
print("插入成功")

conn.commit()
conn.close()
