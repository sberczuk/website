!#/bin/sh

echo $1 $2
defs="-DisbnIn=${1}"
categoryDef="-Dfoo.bar=${2}"

if test -n "${2}"; then

  defs="$defs $categroyDef"
fi

echo $defs

