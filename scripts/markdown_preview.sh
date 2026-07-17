#!/usr/bin/env bash
set -e

FILE="$1"
OUT="${FILE%.md}.html"

pandoc "$FILE" -s -o "$OUT"
xdg-open "$OUT" >/dev/null 2>&1 &
