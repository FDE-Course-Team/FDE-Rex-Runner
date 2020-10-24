ssh -T git@github.com
git add .
git commit -m "$(date "+%Y-%m-%d %H:%M:%S")"
git push origin main