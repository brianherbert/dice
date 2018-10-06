<?php

$die = strtolower($argv[1]);

$exploded = explode('d', $die);

if(empty($exploded[0])) {
    $rolls = 1;
}else{
    $rolls = (int)$exploded[0];
}

$right_side = $exploded[1];

$mod_plus = strpos($right_side,'+');
$mod_minus = strpos($right_side,'-');

if ($mod_plus == TRUE) {
    $r_exploded         = explode('+',$right_side);
    $modifier           = (int)$r_exploded[1];
    $modifier_operation = '+';
    $sides              = (int)$r_exploded[0];
} elseif ($mod_minus == TRUE) {
    $r_exploded         = explode('-',$right_side);
    $modifier           = (int)$r_exploded[1];
    $modifier_operation = '-';
    $sides              = (int)$r_exploded[0];
} else {
    $modifier           = 0;
    $modifier_operation = '+';
    $sides              = (int)$right_side;

}

$total = 0;
$roll  = 0;
while($roll < $rolls) {
    $total += random_int(1,$sides);
    $roll++;
}

if ($modifier_operation == '+') {
    $total += $modifier;
} elseif ($modifier_operation == '-') {
    $total -= $modifier;
}

echo $total."\n";