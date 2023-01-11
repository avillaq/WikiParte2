#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;
my $q = CGI->new;
my $name = $q->param('name');
my $password = $q->param('password');

my $dsn = "DBI:mysql:database=datospaginaxml;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("SELECT firstname, lastname FROM users WHERE userName=? AND password=?");
$sth->execute($name, $password);
    
my @array = $sth->fetchrow_array;
$sth->finish();
$dbh->disconnect;

my $firstname = $array[0];
my $lastname = $array[1];

#Si el array no tiene elementos, entonces no existe el usuario
if(@array == 0) {
    $name="";
    $firstname="";
    $lastname="";
}

print $q->header('text/xml');    
print<<XML;
<?xml version='1.0' encoding='utf-8'?>
    <user>
        <owner>$name</owner>
        <firstName>$firstname</firstName>
        <lastName>$lastname</lastName>
    </user>
XML
