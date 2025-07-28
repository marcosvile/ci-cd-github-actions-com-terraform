from flask import Flask, jsonify, Response
import random
import json

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

frases = [
    "Acredite em você!",
    "Não pare até se orgulhar.",
    "Você é mais forte do que imagina.",
    "O sucesso é a soma de pequenos esforços repetidos todos os dias.",
    "Grandes coisas nunca vêm da zona de conforto.",
    "Com grandes poderes, vem grandes responsabilidades"
]

@app.route('/frase', methods=['GET'])
def frase_aleatoria():
    frase = random.choice(frases)
    
    return Response(
        json.dumps({"frase": frase}, ensure_ascii=False),
        content_type='application/json; charset=utf-8'
    )

@app.route('/', methods=['GET'])
def home():
    return Response(
        json.dumps({"messagem": "Bem-vindo à API de Frases Motivacionais"}, ensure_ascii=False),
        content_type='application/json; charset=utf-8'
    )

@app.errorhandler(404)
def not_found(error):    
    return Response(
        json.dumps({"error": "Rota não encontrada"}, ensure_ascii=False),
        status=404,
        content_type='application/json; charset=utf-8'
    )

if __name__ == '__main__':
    app.run(debug=True)
