from apiflask import APIFlask, Schema
from apiflask.fields import String, Integer
from apiflask.validators import Length, OneOf
from flask_sqlalchemy import SQLAlchemy
import os

app = APIFlask(__name__)

class StudentIn(Schema):
    name = String(requerement=True, validate=Length(0, 32))
    level = String(required=True, validate=OneOf(['HF', 'AP', 'PE','ICT']))

class StudentOut(Schema):
    id = Integer()
    name = String()
    level = String()
    
basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'app.db')

db = SQLAlchemy(app)

class StudentModel(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32))
    level = db.Column(db.String(8))

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

@app.delete('/delete_students/<int:id>')
@app.output(StudentOut, status_code=201)
def delete_student(id):
    student = db.get_or_404(StudentModel, id)
    db.session.delete(student)
    db.session.commit()
    return student

with app.app_context():
    db.create_all()