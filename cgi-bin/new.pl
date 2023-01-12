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

#Combrobamos que el usuario ingresado exista en la tabla users
my @array = $sth->fetchrow_array();
if (@array == 0) {
    $texto = "";
    $titulo = "";
}
else {
    #Añadiremos un nuevo articulo con "true"
    if($isNuevo eq "true"){
        $sth = $dbh->prepare("INSERT INTO articles VALUES(?,?,?)");
        $sth->execute($titulo,$usuario,$texto);

    }
    #Si queremos actualizar el texto con "false"
    else{
        #Comprobamos que el usuario y el titulo existan
        $sth = $dbh->prepare("select text from articles where title=? and owner=?");
        $sth->execute($titulo,$usuario);
        my @array_2 = $sth->fetchrow_array();
        if (@array_2 == 0){
            $texto = "";
            $titulo = "";
        }
        #Si existen, se procedera a actualizar
        else {
            $sth = $dbh->prepare("UPDATE articles SET text=? where title=? and owner=?");
            $sth->execute($texto,$titulo,$usuario);
        }
        
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
