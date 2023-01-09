#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;

my $q = CGI->new;
my $name = $q->param('name');
my $password = $q->param('password');

if($name eq "" || $password eq ""){
    print "Location: ../login.html \n\n";
}
else{
    my $dsn = "DBI:mysql:database=datostienda;host=127.0.0.1";
    my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
    my $sth = $dbh->prepare("SELECT userName, password FROM users WHERE name=? AND password=?");
    $sth->execute($name, $password);
    
    my @array = $sth->fetchrow_array;

    $dbh->disconnect;

    #Si el array esta vacio significa que no existe el usuario
    if(@array != 0){
        print "Location: ./list.pl \n\n"; 
    }
    else{
        print "Location: ../index.html \n\n";
    }
}
