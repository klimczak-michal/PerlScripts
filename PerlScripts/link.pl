#!/usr/bin/perl -w

#In specified directory tree find symbolic links with the same name as file to which the links point to

if ($#ARGV != 0) {die ("Z³a iloœæ parametrów")};
if (! -d $ARGV[0]) {die ("Argument nie jest katalogiem");}

use File::Find;
use Cwd 'abs_path';

$zm = 0;

find(\&funkcja, $ARGV[0]);

print "\n\n$zm";

sub funkcja {

if (-l $_)
{
$zm = abs_path($_);
@plik = split(/\//, $zm);

$sciezka = $File::Find::name;
@symlink = split(/\//, $sciezka);
    if ($plik[$#plik] eq $symlink[$#symlink])
    {
    print "Plik: $zm\nDowiazanie: $sciezka\n";
    }
}
}