#!/bin/bash


docker run -d \
	-v parler:/home/vscode/data \
	-v /home/ozlevka/projects:/home/vscode/projects \
	-v /home/ozlevka/remote:/home/vscode/remote \
	-p 2022:22 \
	ghcr.io/ozlevka/parler-tts:v0.0.1
