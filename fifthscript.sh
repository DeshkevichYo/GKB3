#!/bin/bash

# Проверка наличия аргументов
if [ $# -ne 1 ]; then
    echo "Usage: $0 [timer_duration_in_seconds]"
    exit 1
fi

# Получаем параметр таймера
timer_duration=$1

# Начальное время запуска таймера
start_time=$(date +%s)

# Основной цикл таймера
while true; do
    # Текущее время
    current_time=$(date +%s)

    # Прошедшее время с момента запуска таймера
    elapsed_time=$((current_time - start_time))

    # Время, оставшееся до завершения таймера
    remaining_time=$((timer_duration - elapsed_time))

    # Выводим сообщение о времени
    echo "Elapsed time: $elapsed_time seconds, Remaining time: $remaining_time seconds"

    # Проверяем, завершился ли таймер
    if [ $elapsed_time -ge $timer_duration ]; then
        echo "Timer finished!"
        break
    fi

    # Ждем 1 секунду перед следующей итерацией
    sleep 1
done
