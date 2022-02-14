#!/bin/sh
ln -s ~/dotfiles ~/sync/dotfiles;
cat > .stignore <<'EOF'
(?d).DS_Store
(?d).git
(?d)gitignored/vimfiles/plugged/*
EOF

echo done
