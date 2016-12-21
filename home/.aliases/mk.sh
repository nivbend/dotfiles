mkproj()
{
    dir=${1:?"Unspecified path"}

    git init "$HOME/projects/$dir"
    cd "$HOME/projects/$dir"

    echo '*.~' >> .gitignore
    echo '*.pyc' >> .gitignore
    git add .gitignore

    git commit -m "Create repository"
    echo "Update .gitignore if neccessary and run 'git commit -a --ammend --no-edit'"
}

mkmod()
{
    dir=${1:?"Unspecified path"}

    mkdir -p "$dir"
    touch "$dir/__init__.py"
}
