import requests
import json
from pprint import pprint
import argparse


def get_gender(name: str, song: str):
    url ="http://localhost:5008/get_gender"
    myobj = {"artist_name":f"{name}", "artist_song":f"{song}"}
    x = requests.post(url, json=myobj)
    res = x.json()
    pprint(res['choices'][0]['message']['content'])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="program for testing llama server")
    parser.add_argument("--name", help='name of the artist you want to find the gender')
    parser.add_argument("--song", help='song of the artist youre searching')

    args=parser.parse_args()
    pprint(args)
    get_gender(str(args.name), str(args.song))