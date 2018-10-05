#!/usr/bin/env Rscript

# TODO: Test for other incantations of die (works with 2d10+4 but not d6)

die = commandArgs(trailingOnly=TRUE)[1]

#print(die)

split_die <- strsplit(die, "d")

rolls <- as.integer(split_die[[1]][1])

right_d <- split_die[[1]][2]

matches <- regmatches(right_d, gregexpr("[[:digit:]]+", right_d))
remaining_digits <- as.numeric(unlist(matches))

sides <- remaining_digits[1]

modifier <- remaining_digits[2]

if (is.na(modifier)) {
    modifier <- 0
} else {
    modifier <- as.numeric(modifier)
}

total = 0
roll = 0
while (roll < rolls) {
    total <- total + sample(1:sides, 1)
    roll = roll + 1
}

if (grep("+",right_d) == 1) {
    total = total + modifier
} else if (grep("-",right_d) == 1) {
    total = total - modifier
}

invisible(total)

print(total)