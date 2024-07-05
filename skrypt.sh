#!/bin/bash

case "$1" in
  --date|-d)
    echo "Dzisiejsza data: $(date)"
    ;;
  --logs|-l)
    num_files=${2:-100}
    for ((i=1; i<=num_files; i++))
    do
      echo -e "Nazwa pliku: log${i}.txt\nNazwa skryptu: skrypt.sh\nData: $(date)" > "log${i}.txt"
    done
    ;;
  --help|-h)
    echo "Dostępne opcje:"
    echo "--date, -d        : wyświetla dzisiejszą datę"
    echo "--logs, -l [n]    : tworzy n plików logx.txt (domyślnie 100)"
    echo "--help, -h        : wyświetla pomoc"
    echo "--init            : klonuje repozytorium i ustawia PATH"
    echo "--error [n], -e [n]: tworzy n plików errorx/errorx.txt (domyślnie 100)"
    ;;
  --init)
    git clone https://github.com/zaannyy/Lab4.git
    export PATH=$PATH:$(pwd)
    ;;
  --error|-e)
    num_files=${2:-100}
    mkdir -p errorx
    for ((i=1; i<=num_files; i++))
    do
      echo -e "Nazwa pliku: error${i}.txt\nNazwa skryptu: skrypt.sh\nData: $(date)" > "errorx/error${i}.txt"
    done
    ;;
  *)
    echo "Nieznana opcja. Użyj --help lub -h aby zobaczyć dostępne opcje."
    ;;
esac