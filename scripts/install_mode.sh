#!/bin/bash

# Usage: ./install_mode.sh modes/dev.txt

list_file="$1"

if [[ ! -f "$list_file" ]]; then
  echo "Error: Mode file not found: $list_file"
  exit 1
fi

echo "Installing packages from $list_file..."
echo "---------------------------------------"

while IFS= read -r pkg || [[ -n "$pkg" ]]; do
  if [[ -n "$pkg" ]]; then
    echo "📦 Installing: $pkg"
    sudo pacman -S --noconfirm --needed "$pkg"
  fi
done < "$list_file"

echo "✅ Done installing $list_file"
