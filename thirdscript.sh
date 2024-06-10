#!/bin/bash

# Функция для выделения подстроки из исходной строки
# Аргументы:
# $1 - исходная строка
# $2 - начальный индекс
# $3 - конечный индекс
# $4 - флаг выделения (true - выделить подстроку, false - удалить подстроку)
extract_substr() {
    local str=$1
    local start=$2
    local end=$3
    local extract=$4

    # Проверяем, что начальный и конечный индексы корректны
    if [ $start -le $end ] && [ $end -le ${#str} ]; then
        if [ "$extract" = true ]; then
            # Выделяем подстроку
            echo "${str:$start-1:$end-$start+1}"
        else
            # Удаляем подстроку
            echo "${str:0:$start-1}${str:$end}"
        fi
    else
        echo "Error: Invalid start or end index."
    fi
}

# Пример использования функции для выделения подстроки
original_string="Hello, world!"
start_index=3
end_index=8

echo "Original string: $original_string"
echo "Extracted substring: $(extract_substr "$original_string" $start_index $end_index true)"

# Пример использования функции для удаления подстроки
echo "String after removal: $(extract_substr "$original_string" $start_index $end_index false)"
