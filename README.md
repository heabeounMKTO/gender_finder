# gender_finder
i somehow need to find gender of artists (alot of them), so this is something i cobbled together in under an hour

# what 

### motivation
i got fed up with using ChatGPT's api's free tier's (broke boy speaking) limitations

### how it works

this is basically overkill (or maybe it's just that im lazy to come up with a "smart" solution), it uses 
`llama-cpp-python` for llama2 model inference with `bottle` server (i can use flask but i want to be a hipster) as a rest api.

### installation

it runs on docker , so you might want to create a local docker registry or maybe modify things to however it works for you. i assume you are using linux
#### what u need:
- `docker` (duh?!)
- `make` (comes pre installed with linux)

```bash
make docker_reg 
# optional if you want to have a local registry, by default it at port 5000 you can use the the argument DOCKER_REG_PORT
make chatathome
# builds our somewhat shitty chatgpt api 
```

run the container <br>
note: you might need to use `sudo` if your docker needs `sudo` 

```bash
sudo chmod +x start_gpt.sh
LLAMA_MODEL_PATH='/path/to/llama/model/dir' ./start_gpt.sh  
```

server should be started in localhost:5008, you can change this in the `config.ini` file, as well as change whatever GGUF model you have. everything runs on the CPU (we dont have to deal with NVIDIA on this one chief)<br>

an example request code can be found in `test_post.py`, you can also run the test file and get gender by

```bash
python3 test_post.py --name "billie joe armstrong" --song "letter bomb"
```

should output 

```bash
Namespace(name='billie joe armstrong', song='letter bomb')
'\nBillie Joe Armstrong is male.'
```
