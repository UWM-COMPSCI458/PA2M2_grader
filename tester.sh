#!/bin/bash

SUBMISSION=$1

TOTAL_SCORE=0

function test_asm() {
  MAX_SCORE=$2
  SCORE=$(("$2" + 0))
  echo "## Testing $1"

  echo "### Assembly code:"
  echo "\`\`\`"
  cat "$1.asm"
  echo "\`\`\`"
  echo

  echo "### Text:"
  echo "\`\`\`"
  cat "$1.asm"
  echo "\`\`\`"
  echo


  echo "### Data:"
  echo "\`\`\`"
  cat "$1.asm"
  echo "\`\`\`"
  echo

  echo "### Provided input:"
  echo "\`\`\`"
  cat "$1.in"
  echo "\`\`\`"
  echo

  
  echo "### Expected output:"
  echo "\`\`\`"
  cat "$1.out"
  echo "\`\`\`"
  echo

  cp "$1.asm" curtest.asm
  cp "$1.text" curtest.text
  cp "$1.data" curtest.data
  cp "$1.out" curtest.out
  cp "$1.in" curtest.in
  
  result=$(cat curtest.in | ./$SUBMISSION curtest.text curtest.data)

  echo "### Evaluated output:"
  echo "\`\`\`"
  echo $result
  echo "\`\`\`"
  echo

  correct_result=$(cat curtest.out)


  if [ $result != $correct_result ]; then
    SCORE=0
  fi
    

  echo
  
  if [ "$SCORE" -eq 0 ]; then
    echo "**Evaluated output did not match the expected output**"
    echo "**Score for $1: 0 / $MAX_SCORE ❌**"
  else
    echo "**Evaluated output matched the expected output**"
    echo "**Score for $1: $SCORE / $MAX_SCORE ✅**"
  fi
  echo "********"
  echo


  ((TOTAL_SCORE+=SCORE))

  rm curtest.*
}


test_asm test1 5
test_asm test2 10
test_asm test3 10
test_asm test4 15
test_asm test5 25
test_asm test6 35

echo
echo "# Total score: $TOTAL_SCORE / 100"
exit $TOTAL_SCORE
