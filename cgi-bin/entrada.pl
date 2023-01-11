#!C:/xampp/perl/bin/perl.exe -w
use strict;
use CGI;

my $q = CGI->new;

my $entrada = $q->param('entrada');

if ($entrada eq "login") {
    print "Location: ../login.html \n\n";
}
elsif ($entrada eq "register") {
    print "Location: ../register.html \n\n";
}
elsif ($entrada eq "new") {
    print "Location: ../new.html \n\n";
}
elsif ($entrada eq "list") {
    print "Location: ../list.html \n\n";
}
elsif ($entrada eq "view") {
    print "Location: ../view.html \n\n";
}
elsif ($entrada eq "delete") {
    print "Location: ../delete.html \n\n";
}
elsif ($entrada eq "article") {
    print "Location: ../article.html \n\n";
}
elsif ($entrada eq "update") {
    print "Location: ../update.html \n\n";
}