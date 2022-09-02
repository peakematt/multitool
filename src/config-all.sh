#! /bin/bash

for f in /scripts/config-scripts/*.sh; do
    /bin/bash "$f" || break
done