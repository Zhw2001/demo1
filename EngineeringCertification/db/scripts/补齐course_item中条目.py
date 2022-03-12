import pymysql

conn = pymysql.connect(host='localhost',
                       user='root',
                       password='123456',
                       database='graduationdb')

cursor = conn.cursor()

sql = "SELECT part_id, name FROM course_part"
cursor.execute(sql)

for row in cursor.fetchall():
    sql = f"""
        SELECT count(*)
        FROM course_item
        WHERE course_item.part_id={row[0]}
    """
    cursor.execute(sql)
    res = cursor.fetchall()
    if res[0][0] != 0:
        continue
    sql = f"""
        INSERT INTO course_item (part_id, name, score, `index`)
        VALUES ('{row[0]}', '{row[1]}',  '100','0');
    """
    print(sql)
    cursor.execute(sql)

conn.commit()
conn.close()
