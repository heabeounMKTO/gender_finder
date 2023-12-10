from llama_cpp import Llama
from pprint import pprint
from bottle import route, run, template, get, post, request

import configparser

config = configparser.ConfigParser()
config.read("config.ini")
ADDRESS = config["SERVER"]["ADDRESS"]
PORT = int(config["SERVER"]["PORT"])
MODEL_NAME = config["LLAMA_MODEL"]["MODEL"]
# llama model
llm = Llama(
    model_path=f"/tmp/models/{MODEL_NAME}",
    chat_format="llama-2",
    n_ctx=4096,
    n_batch=1024,
)


@route("/")
def index():
    return template(
        "<b>there is nothing to see here {yet} :| </b>", yet="(yes there is)"
    )


@post("/get_gender")
def get_gender():
    data = eval(request.body.getvalue().decode("utf-8"))
    prompt = f"what is the gender of the artist {data['artist_name']} , who sings the song {data['artist_song']} please answer in only a single word in only one word"

    result = llm.create_chat_completion(
        messages=[{"role": "user", "content": prompt}], max_tokens=4096
    )
    return result


@post("/general_request")
def general(prompt):
    result = llm.create_chat_completion(messages=[{"role": "user", "content": prompt}])


run(host=ADDRESS, port=PORT, server="paste")
