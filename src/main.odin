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

		for i := 0; i < len(line); i += 1 {
			c := line[i]
			found_first := first != 0

			if !found_first && c >= '0' && c <= '9' {
				first = c
				found_first = true
			}
			if found_first && c >= '0' && c <= '9' {
				last = c
			}
		}

		concated := strings.builder_make()
		defer strings.builder_reset(&concated)

		fmt.sbprintf(&concated, "%c%c\n", first, last)
		total += strconv.atoi(strings.to_string(concated))
	}

	fmt.printf("%d", total)
}
