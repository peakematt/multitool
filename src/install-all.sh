#! /bin/bash

for f in /scripts/tools/*.sh; do
    /bin/bash "$f" || break
done