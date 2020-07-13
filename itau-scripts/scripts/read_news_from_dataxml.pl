@d = sort(</var/nextvision/media/20[1-9][0-9][0-9][0-9][0-9][0-9].[0-2][0-9][0-9][0-9][0-9][0-9].*/>);
@ARGV = (pop(@d) . "data.xml");
$hostname = `hostname`;
chomp $hostname;
print "\n\nProcessando [", $hostname, "]: ", $ARGV[0], "\n\n";
$i = 1;
while(<>){
    next if not (($t,$c,$n) = /<text title="(.*?)".* category="(.*?)">(.*)<\/text>/);

    # ignora mensagens Itau e Quiz
    next if $c=~/^(Itau|Quiz)$/;

    printf "%2d. [%s] %s\n%s\n\n", $i++, $c, $t, wrap("\t", "\t", $n)
}
