package main

import "core:bufio"
import "core:fmt"
import "core:io"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	data, ok := os.read_entire_file("day01-input.txt")
	if !ok {
		return
	}
	defer delete(data)

	it := string(data)

	total: int
	for line in strings.split_lines_iterator(&it) {
		first, last: u8

		i := 0
		for c := line[i]; i < len(line); i += 1 {
			c := line[i]
			if c >= '0' && c <= '9' {
				first = c
				break
			}
		}

		for ; i < len(line); i += 1 {
			c := line[i]
			if c >= '0' && c <= '9' {
				last = c
			}
		}

		arr := [2]byte{first, last}
		total += strconv.atoi(string(arr[:]))
	}

	fmt.printf("%d", total)
}
