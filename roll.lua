-- 2d6+78 format
function roll(die)

  local rolls
  local sides
  local modOperation = '+'
  local modifier = 0

  i, j = string.find(die, "d")
  if i == 1 then
    rolls = 1
  else
    rolls = tonumber(string.sub(die, 0, (j-1)))
  end

  afterD = string.sub(die, (j+1), string.len(die))
  i, j = string.find(afterD, "%d+")
  sides = tonumber(string.sub(afterD, i, j))

  afterSides = string.sub(afterD, (j+1), string.len(afterD))

  if string.len(afterSides) == 0 then
    modOperation = '+'
    modifier = 0
  else
    modOperation = string.sub(afterSides, 1, 1)
    modifier = tonumber(string.sub(afterSides, 2, string.len(afterSides)))
  end

  -- the os.time() is commonly cited as a good way to randomly
  --    seed randomness. However, die rolls aren't random in
  --    this case when running the script multiple times in one
  --    second. FOund this seeding technique on:
  --    https://www.reddit.com/r/lua/comments/1b5qg3/need_help_with_truly_random_number_generator/c940pyj/
  math.randomseed(os.time() + tonumber(tostring({}):sub(8)))

  local roll = 0
  local total = 0
  while roll < rolls do
    total = total + math.random(1, sides)
    roll = roll + 1
  end

  -- Finsihed with our rolls, now add/subtract our modifier
  if modOperation == "+" then
    total = total + modifier
  elseif modOperation == "-" then
    total = total - modifier
  end

  return total
end

die = arg[1]

if die == nil then
  print("Try:    lua roll.lue 2d6+2")
  os.exit()
end

print(roll(die))