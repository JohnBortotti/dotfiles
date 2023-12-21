project_file="draft.md"

if [[ -z "$1" ]]; then
    echo -e "Usage: projects.sh <directory> [-p|-t]\n-p: list projects\n-t: list tasks"
    exit 1
fi

if [[ -n "$2" ]]; then
    # list projects
    if [[ "$2" == "-p" ]]; then
        for dir in $(find $1 -type d); do
            if [[ -f "${dir}/${project_file}" ]]; then
                echo "project: ${dir}"
                echo "-------------------------"
            fi
        done
    # list tasks
    elif [[ "$2" == "-t" ]]; then
        for dir in $(find $1 -type d); do
            if [[ -f "${dir}/${project_file}" ]]; then
                echo "project: ${dir}"
                echo "tasks:"
                grep -E '^\s*-\s*\[[ x]\]' "${dir}/${project_file}"
                echo "-------------------------"
            fi
        done
    else
        echo -e "Usage: projects.sh <directory> [-p|-t]\n-p: list projects\n-t: list tasks"
        exit 1
    fi
else 
    echo -e "Usage: projects.sh <directory> [-p|-t]\n-p: list projects\n-t: list tasks"
    exit 0
fi