#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;

my $q = CGI->new;

my $entrada = $q->param('entrada');

print $q->header('text/html');    
print<<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../styles/general.css">
    <link rel="stylesheet" href="../styles/formGeneral.css">
    <title>Wiki</title>
</head>
<body>
    <div class="wrap">
HTML
my $form="";

##Las siguientes lineas pueden ser reducidas un poco mas, ya que hay codigo que se repite 
if ($entrada eq "login") {
    $form="<form action='./login.pl' method='post'>
                <label>Usuario</label>
                <input class='inputText' type='text' name='name' required>

                <label>Contrasena</label>
                <input class='inputText' type='password' name='password' required>
                <br>";
}
elsif ($entrada eq "register") {
    $form = "<form action='./register.pl' method='post'>
                <label>Nombre</label>
                <input type='text' class='inputText' name='newfirstname' required>
                
                <label>Apellido</label>
                <input type='text' class='inputText' name='newlastname' required>
                
                <label>Nombre de usuario</label>
                <input type='text' class='inputText' name='newname' required>
                
                <label>Contrasena</label>
                <input type='password' class='inputText' name='newpassword' required>
                <br>";
}
elsif ($entrada eq "new") {
    $form = "<form action='./new.pl' method='post'>
            <label>Titulo</label>
            <input class='inputText' type='text' name='titulo' required>

            <label>Texto</label>
            <textarea class='inputTextArea' name='texto' rows='8' required></textarea>

            <label>Nombre de usuario</label>
            <input class='inputText' type='text' name='usuario' required><br>

            <input type='hidden' name='esNuevo' value='true'>";
}
elsif ($entrada eq "list") {
    $form = "<form action='./list.pl' method='post'>
            <label>Nombre de usuario</label>
            <input class='inputText' type='text' name='usuario' required>
            <br>";
}
elsif ($entrada eq "view") {
    $form = "<form action='./view.pl' method='post'>
            <label>Nombre de usuario</label>
            <input class='inputText' type='text' name='usuario' required>

            <label>Titulo</label>
            <input class='inputText' type='text' name='titulo' required>
            <br>";
}
elsif ($entrada eq "delete") {
    $form = "<form action='./delete.pl' method='post'>
            <label>Nombre de usuario</label>
            <input class='inputText' type='text' name='usuario' required>

            <label>Titulo</label>
            <input class='inputText' type='text' name='titulo' required>
            <br>";
}
elsif ($entrada eq "article") {
    $form = "<form action='./article.pl' method='post'>
            <label>Nombre de usuario</label>
            <input class='inputText' type='text' name='usuario' required>

            <label>Titulo</label>
            <input class='inputText' type='text' name='titulo' required>
            <br>";
}
elsif ($entrada eq "update") {
    $form = "<form action='./new.pl' method='post'>
            <label>Titulo</label>
            <input class='inputText' type='text' name='titulo' required>

            <label>Texto</label>
            <textarea class='inputTextArea' name='texto' rows='8' required></textarea>

            <label>Nombre de usuario</label>
            <input class='inputText' type='text' name='usuario' required><br>

            <input type='hidden' name='esNuevo' value='false'>";
}

print<<HTML;
            $form
            <input class="inputSubmit" type="submit" value="Enviar">
        </form>
        <a href="../index.html">Atras</a>
    </div>
</body>
</html>
HTML