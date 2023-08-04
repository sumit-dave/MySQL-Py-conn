import mysql.connector as conn

mydb=conn.connect(host='localhost', user='root', passwd='12345')
print(mydb)
cursor=mydb.cursor()
cursor.execute('create database if not exists test1')
s='create table if not exists sumit2.workplace1(employee_id int(10),employee_name varchar(80),emp_email varchar(20),emp_salary int(6),emp_attandace int(3))'
q1=cursor.execute(s)

q2=cursor.execute('select *from sumit2.workplace1')
print(q2)
