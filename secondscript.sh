#!/bin/bash

# Функция для вывода временных штампов файла
get_timestamps() {
    # Проверяем, существует ли файл
    if [ -f "$1" ]; then
        echo "File: $1"
        # Выводим три временных штампа
        echo "Creation time: $(stat -c %w "$1")"
        echo "Last modification time: $(stat -c %y "$1")"
        echo "Last access time: $(stat -c %x "$1")"
    else
        echo "Error: File '$1' not found or is not a regular file."
    fi
}

# Проверяем, переданы ли аргументы
if [ $# -eq 0 ]; then
    echo "Usage: $0 [file1] [file2] ..."
    exit 1
fi

# Перебираем все переданные файлы
for file in "$@"; do
    get_timestamps "$file"
done
