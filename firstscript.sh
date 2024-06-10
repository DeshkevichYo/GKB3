#!/bin/bash

# Проверка количества аргументов
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 filename new_extension"
  exit 1
fi

# Извлечение аргументов
filename=$1
new_extension=$2

# Проверка наличия расширения у файла
if [[ "$filename" == *.* ]]; then
  # Если расширение есть, отделить основную часть имени файла
  base_name="${filename%.*}"
else
  # Если расширения нет, использовать имя файла как есть
  base_name="$filename"
fi

# Создание нового имени файла с новым расширением
new_filename="${base_name}.${new_extension}"

# Вывод нового имени файла
echo "New filename: $new_filename"

