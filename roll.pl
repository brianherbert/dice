# Get die roll argument
my $die = @ARGV[0];

print "Rolling: ".$die."\n";

$die =~ /(?:(\d+)\s*X\s*)?(\d*)D(\d*)((?:[+\/*-]\d+)|(?:[+-][LH]))?/i
        and my ($times) = $1
        and my ($rolls) = $2
        and my ($sides) = $3
        and my ($modifier) = $4;

# If we didn't find any "times" then do it once
if ($times eq "") {
    $times = 1;
}

if ($rolls eq "") {
    $rolls = 1;
}

if ($modifier eq "") {
    $modifier = "+0";
}

# + or - if using standard die notation
$mod_operation = substr($modifier, 0, 1);
$mod_val = substr $modifier, 1;

#print "Times " . $times . "\n";
#print "Rolls " . $rolls . "\n";
#print "Sides " . $sides . "\n";
#print "Modifier " . $modifier . "\n";

$total = 0;
while ($times > 0) {

    $roll_result = 0;

    while ($rolls > 0) {

        # We are rolling the die now and adding as we go
        $roll_result += int(rand($sides)) + 1;

        $rolls--;
    }

    # Perform modifier
    if ($mod_operation eq "+") {
        $total += $roll_result + $mod_val;
    } elsif ($mod_operation eq "-") {
        $total += $roll_result - $mod_val;
    } else {
        $total += $roll_result;
    }

    $times--;
}

print $total."\n";