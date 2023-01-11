#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
my $usuario = $q->param('usuario');

my $dsn = "DBI:mysql:database=datospaginaxml;host=127.0.0.1";
my $dbh = DBI->connect($dsn, "Alex", "") or die "No se pudo conectar";

my $sth = $dbh->prepare("select title from articles where owner = ?");
$sth->execute($usuario);

my @misTitulos;
my $i = 0;
while(my @array = $sth->fetchrow_array()){
  $misTitulos[$i] = $array[$i];
  $i++;
}

if(@misTitulos == 0){
  
}else{

}



=pot
if (@array == 0) {

}
else {
  print @array;
}

my @titulo;
my $i = 0;

my $sth = $dbh->prepare("select * from paginas");
$sth->execute();

while(my @row = $sth->fetchrow_array){
  $titulo[$i] = $row[0];
  $i++;
}
$sth->finish;
$dbh->disconnect;

my $funtion = listaTitulos(@titulo);

print $q->header('text/xml');    
print<<XML;
<?xml version='1.0' encoding='utf-8'?>
    <article>
        <title>$titulo</title>
        <text>$texto</text>
    </article>
XML


sub listaTitulos(){
  my $lista="";
  foreach my $t(@_){
    $lista = $lista."<li>
    <div class='item'>

    <label>$t</label>

    <form action='./view.pl'>
    	<input type='hidden' name='title' value='$t'>
	    <input type='submit' value='Ver'>
    </form>

    <form action='./edit.pl'>
      <input type='hidden' name='title' value='$t'>
	    <input type='submit' value='Editar'>
    </form>
    
    <form action='./delete.pl'>
    	<input type='hidden' name='title' value='$t'>
	    <input type='submit' value='X'>
    </form>

    
    </div>
    
    </li>";
  }
  return $lista;
}
=cut