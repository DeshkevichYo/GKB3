#!/bin/bash

# Проверка наличия аргументов
if [ $# -eq 0 ]; then
    echo "Usage: $0 [file1] [file2] ..."
    exit 1
fi

# Перебор переданных файлов
for file in "$@"; do
    # Проверка, является ли файл текстовым
    if [ -f "$file" ] && [ "${file##*.}" = "txt" ]; then
        # Добавление временного штампа в конец файла
        echo "$(cat "$file") $(date)" > "$file.tmp" && mv "$file.tmp" "$file"
        echo "Timestamp added to $file"
    else
        echo "Error: $file is not a text file or does not exist"
    fi
done
