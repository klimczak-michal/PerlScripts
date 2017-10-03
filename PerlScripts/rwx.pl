#!/usr/bin/perl -w

#In specified directory, find regular files for which user has rights to write and execute and group OR others can't execute

$mode = 0;

opendir($handle, $ARGV[0]) || die "Nie moge otworzyæ $ARGV[0]";

while ($plik = readdir $handle)
{
    $mode = (stat($plik))[2]) & 07777);
    #print("$mode\n");
    $user = substr($mode, 0, 1);
    $group = substr($mode, 1, 1);
    $other = substr($mode, 2, 1);

    if (($user == 3 || $user == 7) && (($group == 4 || $group == 2 || $group == 6) || ($other == 4 || $other == 2 || $other == 6))
    {
    print("$plik\n");
    }     
}

closedir $handle; 