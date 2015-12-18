echo $(( $(grep [0-9] times.md | tr '\n' '+' | sed -e 's/\(.*\)+$/\1/')))
