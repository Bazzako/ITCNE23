
from apiflask import APIFlask, Schema
from apiflask.fields import String, Integer, Float
from apiflask.validators import Length, OneOf
from flask_sqlalchemy import SQLAlchemy
import os

app = APIFlask(__name__)

# note for a Core table, we use the sqlalchemy.Column construct,
# not sqlalchemy.orm.mapped_column

class StudentIn(Schema):
    name = String(requerement=True, validate=Length(0, 32))
    level = String(required=True, validate=OneOf(['HF', 'AP', 'PE','ICT']))

class StudentOut(Schema):
    id = Integer()
    name = String()
    level = String()

class RegisterSchema(Schema):
    student_id = Float()
    course_id = Float()

class CoursesOut(Schema):
    id = Integer()
    name = String()
    
basedir = os.path.abspath(os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URI')\
        or 'sqlite:///' + os.path.join(basedir, 'app.db')


db = SQLAlchemy(app)

association_table = db.Table(
    "association_table",
    db.Column("students_id", db.Integer, db.ForeignKey("students.id")),
    db.Column("courses_id", db.Integer, db.ForeignKey("courses.id"))
)

class StudentModel(db.Model):
    __tablename__ = 'students'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32))
    level = db.Column(db.String(8))
    courses = db.Relationship('CoursesModel', secondary=association_table, back_populates='student')

class CoursesModel(db.Model):
    __tablename__ = 'courses'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32))
    student = db.Relationship('StudentModel', secondary=association_table, back_populates='courses')

@app.post('/create_students')
@app.input(StudentIn, location='json')
@app.output(StudentOut, status_code=201)
def create_student(json_data):
    student = StudentModel(**json_data)
    db.session.add(student)
    db.session.commit()
    return student

@app.get('/get_students/<int:id>')
@app.output(StudentOut, status_code=201)
def get_student(id):
    student = db.get_or_404(StudentModel, id)
    return student

@app.get('/get_students')
@app.output(StudentOut(many=True))
def get_studentall():
    return StudentModel.query.all()

@app.delete('/delete_students/<int:id>')
@app.output(StudentOut, status_code=201)
def delete_student(id):
    student = db.get_or_404(StudentModel, id)
    db.session.delete(student)
    db.session.commit()
    return student

@app.patch('/patch_students/<int:id>')
@app.input(StudentIn(partial=True), location='json')
@app.output(StudentOut, status_code=201)
def patch_student(id, json_data):
    student = db.get_or_404(StudentModel, id)
    for key, value in json_data.items():
        setattr(student, key, value)
    db.session.commit()
    return student

@app.post('/register')
@app.input(RegisterSchema, location='json')
def register(json_data):
    student = StudentModel.query.get(json_data['student_id'])
    course = CoursesModel.query.get(json_data['course_id'])
    student.courses.append(course)
    course.students.append(student)
    db.session.commit()
    #return jsonify({"message": "Student registered successfully"})
 
 
@app.get('/students/<int:student_id>/courses')
@app.output(CoursesOut(many=True))
def get_student_courses(student_id):
    student = db.get_or_404(StudentModel, student_id)
    courses = student.courses
    return courses

with app.app_context():
    db.create_all()