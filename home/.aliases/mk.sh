mkproj()
{
    dir=${1:?"Unspecified path"}

    git init "$HOME/projects/$dir"
    cd "$HOME/projects/$dir"
    touch .gitignore
    git add .gitignore
}

mkmod()
{
    dir=${1:?"Unspecified path"}

    mkdir -p "$dir"
    touch "$dir/__init__.py"
}
