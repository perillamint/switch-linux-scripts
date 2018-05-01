#!/bin/bash

docker run --name switch-linux -v $(pwd)/docker-workdir:/var/lib/workdir -v $(pwd)/docker-result:/var/lib/workresult -ti switch-linux /bin/sh
