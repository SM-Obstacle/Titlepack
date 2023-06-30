#!/bin/bash

for file in *.Map.Gbx; do
    file_name=$(echo "$file" | sed "s/'//g")
    uid=$(grep --binary-files=text -oPm1 '(?<=<ident uid=")[^"]*' "$file")

    printf '    <map>\n'
    printf '        <file>%s</file>\n' "$file_name"
    printf '        <ident>%s</ident>\n' "$uid"
    printf '    </map>\n'
done

printf '\n'
