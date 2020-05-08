#!/bin/sh

fonts_dir="/usr/share/texmf-dist/fonts"
backup_dir="${fonts_dir}.bak"

mv "${fonts_dir}" "${backup_dir}"

cat fonts.txt | \
    grep -v '^#' | \
    grep -v '^[[:space:]]*$' | \
    while read font; do
        find "${backup_dir}" -type f -iname "*${font}*" | \
            while read file; do
                relative_file=$(echo "${file}" | sed "s^${backup_dir}^^")
                file_dir=$(dirname "${relative_file}")
                mkdir -p "${fonts_dir}/${file_dir}"
                mv "${file}" "${fonts_dir}/${relative_file}"
            done
    done

rm -rf "${backup_dir}"
