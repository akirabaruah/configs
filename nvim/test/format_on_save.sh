#!/usr/bin/env sh

set -e  # Exit on error.

input=$(mktemp)
echo "line with trailing whitespace:      " >> $input
echo "blank lines should be condensed into a single blank line:" >> $input
echo "     " >> $input
echo "" >> $input
echo "  " >> $input
echo "empty lines at the end of the file should be removed:" >> $input
echo "" >> $input
echo "" >> $input

expected=$(mktemp)
echo "line with trailing whitespace:" >> $expected
echo "blank lines should be condensed into a single blank line:" >> $expected
echo "" >> $expected
echo "empty lines at the end of the file should be removed:" >> $expected

output=$(mktemp)

# Open the input file with Neovim, then write output file and quit.
nvim --headless -c "w! $output" -c "x" $input 2> /dev/null

echo "Input: $input"
echo "Output: $output"
echo "Expected: $expected"
diff --side-by-side $output $expected
