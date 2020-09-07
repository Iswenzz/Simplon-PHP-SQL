<?php

// no.1
$name = "Alexis";
echo "Utiliser echo pour afficher une chaine de caractères.<br/>";
echo "Bonjour $name !<br/>";

// no.2
$i = 0;
while ((++$i) < 10)
	echo "$i ";
echo "<br/>";
for ($i = 1; $i < 10; $i++)
	echo "$i ";
echo "<br/>";

function printNumbers(int $max): void
{
	for ($i = 1; $i < $max; $i++)
		echo "$i ";
	echo "<br/>";
}
printNumbers(10);

// no.3
$x = 6;
$y = 12;
for ($i = 0; $i < $x; ++$i)
{
	for ($j = 0; $j < $y; ++$j)
	{
		if ($i != 0 && $i != $x - 1)
			echo ($j != 0 && $j != $y - 1) ? "_" : "*";
		else
			echo "*";
	}
	echo "<br/>";
}
