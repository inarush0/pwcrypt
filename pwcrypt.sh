#!/bin/bash
if hash python 2>/dev/null; then
  unset password
  echo -n "Enter password: "
  while IFS= read -r -s -n1 pass; do
    if [[ -z $pass ]]; then
      echo
      break
    else
      echo -n '*'
      password+=$pass
    fi
  done
  python -c "import crypt; print crypt.crypt('$password')"
else
  echo "please install python"
  break
fi

