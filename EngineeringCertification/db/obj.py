# from sqlalchemy.orm import declarative_base
# from sqlalchemy import column, Integer, BigInteger, VARCHAR, Float
#
# Base = declarative_base()
#
#
# class CourseGoal(Base):
#     __tablename__ = "course_goal"
#
#     id = column("course_goal_id", Integer)
#     audit_id = column("audit_id", BigInteger)
#     course_goal_text = column("course_goal_text", VARCHAR(255))
#     excellent = column("excellent", VARCHAR(255))
#     good = column("good", VARCHAR(255))
#     normal = column("normal", VARCHAR(255))
#     passed = column("pass", VARCHAR(255))
#     poor = column("poor", VARCHAR(255))
#     graduate_require = column("graduate_require", VARCHAR(255))
#     eva_point = column("eva_point", VARCHAR(255))
#     total_score = column("total_score", Float)
#     expectation = column("expectation", VARCHAR(255))
#     no_reach = column("no_reach", Integer)
#     achieve_degree = column("achieve_degree", Float)
#     score_description = column("score_description", VARCHAR(255))
#     score_analysis = column("score_analysis", VARCHAR(255))
#
#     def __repr__(self):
#         return f"{self.__name__}(id={self.id}, text={self.course_goal_text})"
#
#
# class CourseModule(Base):
#     __tablename__ = "course_module"
#
#     name = column("name", VARCHAR(255))
#     audit_id = column("audit_id", BigInteger)
#     index = column("index", Integer)
#
#     def __repr__(self):
#         return f"{self.__name__}(name={self.name}, audit id={self.audit_id}, index={self.index}) "
