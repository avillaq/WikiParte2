#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;
use DBI;
my $q = CGI->new;
my $name = $q->param('name');
my $password = $q->param('password');
print "Content-Type: text/xml;\n";
print<<XML;
<?xml version='1.0' encoding='utf-8'?>
    <user>
        <owner></owner>
        <firstName></firstName>
        <lastName></lastName>
    </user>
XML
=pot
if($name eq "" || $password eq ""){
    
}
else{
    my $dsn = "DBI:mysql:database=datospaginaxml;host=127.0.0.1";
    my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";
    
    my $sth = $dbh->prepare("SELECT userName, password FROM users WHERE userName=? AND password=?");
    $sth->execute($name, $password);
    
    my @array = $sth->fetchrow_array;

    $dbh->disconnect;

    

}
sub datosCorrectos{
    print $q->header('text/xml');    
    print<<XML;
    <?xml version='1.0' encoding='utf-8'?>
        <user>
            <owner></owner>
            <firstName></firstName>
            <lastName></lastName>
        </user>
XML
}
sub datosIncorrectos{
    print $q->header('text/xml');    
    print<<XML;
    <?xml version='1.0' encoding='utf-8'?>
        <user>
            <owner></owner>
            <firstName></firstName>
            <lastName></lastName>
        </user>
XML 
}
=cut