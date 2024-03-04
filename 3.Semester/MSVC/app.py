# file: app.py

from flask import request, jsonify
from apiflask import APIFlask, Schema
from apiflask.fields import String, Float
from apiflask.schemas import EmptySchema
from apiflask.validators import Length, OneOf
import requests
app = APIFlask(__name__)


class Calculatordata(Schema):
    a = Float(requered=True)
    b = Float(requered=True)
    op = String(required=True, validate=OneOf(['add', 'mul', 'sub','div']))

class Bitcoindata(Schema):
    currency = String(requered=True, validate=OneOf(['EUR', 'GBP', 'USD']))
    amount = Float(required=True)

@app.route('/')
def hello_world():
    return 'Hello ITCNE! Test Dennis'


@app.route('/calculator', methods=["GET"])
@app.input(Calculatordata, location="query")
def calc(query_data):
    # Hole die Parameter a und b aus der Anfrage
    a = request.args.get("a", type=float)
    b = request.args.get("b", type=float)
    op = request.args.get("op", type=str)
    # Prüfe, ob die Parameter gültig sind
    if a is None or b is None:
        return jsonify({"error": "Invalid parameters"})
    # Führe die Rechenoperation aus
    if op == "add":
        result = a + b
    elif op == "sub":
        result = a - b
    elif op == "mul":
        result = a * b
    elif op == "div":
        result = a / b
    else:
        return jsonify({"error": "Invalid operation"})
    # Gib das Ergebnis als JSON zurück
    return jsonify({"result": result})


@app.route('/Bitcoin')
@app.input(Bitcoindata, location="query")
def Bitcoin_to_EURO(query_data):
    # Amount und Currency in Header from Class Bitcoindata
    amount = query_data["amount"]
    currency = query_data["currency"]

    # Get Bitcoin Worth
    bitcoin = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
    if bitcoin.status_code == 200:
        converstionrate = bitcoin.json()["bpi"][currency]["rate_float"]


        result = amount / converstionrate
    
        return {"result": result}
    else:
        return {"Error": "Input not possible"}
