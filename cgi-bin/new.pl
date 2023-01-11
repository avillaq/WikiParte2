#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
my $titulo = $q->param('titulo');
my $texto = $q->param('texto');
my $usuario = $q->param('usuario');
my $isNuevo = $q->param('esNuevo');

##Conexion con la base de datos###################

my $dsn = "DBI:mysql:database=datospaginaxml;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";

my $sth = $dbh->prepare("Select userName from users where userName=?");
$sth->execute($usuario);

my @array = $sth->fetchrow_array();
if (@array == 0) {
    $texto = "";
    $titulo = "";
}
else {

    if($isNuevo eq "true"){
        $sth = $dbh->prepare("INSERT INTO articles VALUES(?,?,?)");
        $sth->execute($titulo,$usuario,$texto);
    }else{
        $sth = $dbh->prepare("UPDATE articles SET text=? where title=?");
        $sth->execute($texto,$titulo);
    }
}
$sth->finish;
$dbh->disconnect;

##Fin de la conexion ####################

my $newTexto = $texto;
$newTexto =~ s/\n/<br>/g;

print $q->header('text/xml');    
print<<XML;
<?xml version='1.0' encoding='utf-8'?>
    <article>
        <title>$titulo</title>
        <text>$texto</text>
    </article>
XML
