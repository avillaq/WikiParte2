#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $newname = $q->param('newname');
my $newpassword = $q->param('newpassword');
my $newlastname = $q->param('newlastname');
my $newfirstname = $q->param('newfirstname');

my $dsn = "DBI:mysql:database=datospaginaxml;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
my $sth = $dbh->prepare("INSERT INTO users VALUES(?,?,?,?)");
$sth->execute($newname, $newpassword, $newlastname, $newfirstname);
    
$dbh->disconnect;

print "Location: ../index.html \n\n";


