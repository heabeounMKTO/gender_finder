#!/usr/bin/bash

$LLAMA_MODEL_PATH=$1

if [ -z "$LLAMA_MODEL_PATH" ]; then
    echo "ERROR:"
    echo "PLEASE PROVIDE PATH TO LLAMA MODEL FOLDER"
fi

docker run -v $LLAMA_MODEL_PATH:/tmp/models -v $(pwd):/home -p 5008:5008 localhost:5000/chatathome