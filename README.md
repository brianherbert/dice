# Dice

Multiple scripts that roll dice using [dice notation](https://en.wikipedia.org/wiki/Dice_notation).

## Bash

```
> sh roll.sh 2d10+4
```

## Perl

```
> perl roll.pl 2d10+4
```

## Lua

```
> lua roll.lua 2d10+4
```

## R

```
> Rscript roll.r 2d10+4
```

## Dice Regex

/(?:(\d+)\s*X\s*)?(\d*)D(\d*)((?:[+\/*-]\d+)|(?:[+-][LH]))?/i