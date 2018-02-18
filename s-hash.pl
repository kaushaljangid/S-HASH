#!/usr/bin/perl
#Kaushal Jangid
use Digest::MD5 qw( md5_hex );	#libry
use Digest::SHA qw( sha1_hex sha224_hex sha256_hex sha384_hex sha512_hex );	#libry
print " Hash ToolKit ";
mainmenu:;	#menus start
print "\nMenu:\n";
print " 1. Create your Hash. \n";
print " 2. Crack your Hash with Dictionary Attack.\n";
print " 3. Crack your Hash with Brute Force Attack.\n";
print " 4. Exit.\n"; 	#menu ends
print "\nOption: ";
$option=<STDIN>;	#taking inputs 

if ($option!=1 && $option!=2 && $option!=3 && $option!=4 ) 	#condition if input is not equal to the given condition 
{
print "Wrong Option\n";
goto mainmenu;		#after the condition its go to main menu
}
if ($option==1)		#checking condition
{&create_hash}		#its calls creating a hash
if ($option==2)		#checking condition
{&dic_attackoption}	#its calls dic attack
if ($option==3)		#checking condition
{&brute_attack}		#its call brute force attack
if ($option==4)		#checking condition
{&quit}			#its calls quit 
sub create_hash		#function define
{
print " Hash Creator\n";
print "Give me your word: ";
$word = <STDIN>;	#its take input
chomp($word);		#its use for ignore next line
menu:;
	print "		\nmenu\n";	#menu for hash
	print " \n1. Create Hash in MD5";
	print " \n2. Create Hash in SHA1";
	print " \n3. Create Hash in SHA224";
	print " \n4. Create Hash in SHA256";
	print " \n5. Create Hash in SHA384";
	print " \n6. Create Hash in SHA512";
	print " \n7. BACK";
print "\nOption: ";
$option=<STDIN>;	#taking inputs option

if ($option!=1 && $option!=2 && $option!=3 && $option!=4 && $option!=5 && $option!=6 && $option!=7 ) #condition for not equals 
{
print "Wrong Option!!\n";
goto menu;	#after condition its go to menu
}
if ($option==1)		#checking condition
{&create_md5}		#calling md5
if ($option==2)		#checking condition
{&create_sha1}		#calling sha1
if ($option==3)		#checking condition
{&create_sha224}	#calling sha224
if ($option==4)		#checking condition
{&create_sha256}	#calling sha256
if ($option==5)		#checking condition
{&create_sha384}	#calling sha384
if ($option==6)		#checking condition
{&create_sha512}	#calling sha512
if ($option==7)		#checking condition
{&create_menu}		#calling creat menu
}
sub create_md5		#define md5
{
print " Hash is: \n", md5_hex("$word"), "\n\n";
goto mainmenu;
}

sub create_sha1		#define sha1
{
chomp($word);
print " Hash is: \n", sha1_hex("$word"), "\n\n";
goto mainmenu;
}
sub create_sha224	#define sha224
{
print " Hash is: \n", sha224_hex("$word"), "\n\n";
goto mainmenu;
}
sub create_sha256	#define sha256
{
print " Hash is: \n", sha256_hex("$word"), "\n\n";
goto mainmenu;
}
sub create_sha384	#define sha384
{
print " Hash is: \n", sha384_hex("$word"), "\n\n";
goto mainmenu;
}
sub create_sha512	#define sha512
{
print " Hash is: \n", sha512_hex("$word"), "\n\n";
goto mainmenu;
}
sub create_menu		#define create menu
{
goto mainmenu;
}
sub dic_attackoption	#define dic attack
{
print " 	Dictionary attack  \n";
print "Enter your hash here : ";
chomp($hash = <STDIN>);		#taking input without next line
print "Enter the location of dictionary\n";
$words=<STDIN>;			#taking dic location
open (WORDLIST, $words);	#opening dic
print "Wordlist opened successfully!\n";
   @wordlist = <WORDLIST>; 	#taking word list in WORDLIST
   for ($i = 0; $i < @wordlist; $i++){		#condition for each word 
      $h = $wordlist[$i]; 			#each word is define in i
       chomp($h);				#it ignore next line 
	if(length($hash) eq 32)			#checking condition call
	{$dec=md5_hex($h);}
	elsif(length($hash) eq 40)		#checking condition call
	{$dec=sha1_hex($h);}
	elsif(length($hash) eq 56)		#checking condition call
	{$dec=sha224_hex($h);}
	elsif(length($hash) eq 64)		#checking condition call
	{$dec=sha256_hex($h);}
	elsif(length($hash) eq 96)		#checking condition call
	{$dec=sha384_hex($h);}
	elsif(length($$hash) eq 128)		#checking condition call
	{$dec=sha512_hex($h);}
	else{die "$hash     is NOT valid HASH\n";}
       if($dec eq $hash){			#checking condition and print pass
         die "[+]Your password is: $h\n";}
}
print "Not Cracked\n"; 
goto menu;			#it call menu 
}

sub brute_attack 		#define brute attack
{
{
$min=1;
$max=10;
print " ******************BRUTE FORCE ****************** \n";
print "\ta for char\n";
print "\tA for capi char\n";
print "\t1 for integer\n";
print "\t! for special char\n";
print "\t or any combination \n";
print "Enter Type: ";
chomp($type = <STDIN>);		#it takes type 
if ($type=~"a") {		#checking condition
$alpha = "qazwsxedcrfvtgbyhnujmikolp";}
if ($type=~"A") {	#checking condition
$alpha = $alpha. "QAZWSXEDCRFVTGBYHNUJMIKOLP";}
if ($type=~"1") {	#checking condition
$alpha = $alpha."1234567890";}
if ($type=~"!") {	#checking condition
$alpha = $alpha. "!\"\$%&/()=?-.:\\*'-_:.;, ";}
print "Enter HASH: ";
chomp($md5 = <STDIN>);	#it takes input
for ($j=1; $j<=20; $j++)	#loop for length
{mainbrute ($j);}		#its call bruite
sub mainbrute			#define brute
{
$CharSet = shift;	#char shif is define
@RawString = ();
for ($i =0;$i<$CharSet;$i++){ $Brute[i] = 0;}	#for condition for brute fron zero digits 
do{
for ($i =0; $i<$CharSet; $i++){		#condition 
if ($Brute[$i] > length($alpha)-1){	#condition for alpha length brute
if ($i==$CharSet-1){
$try=0;
return false;				#it returns value
}
$Brute[$i+1]++;				#increment 
$Brute[$i]=0;
}}
$pass = "";
for ($i =0;$i<$CharSet;$i++)	#condition for single word
{
$pass = $pass . substr($alpha,$Brute[$i],1);	#it combine alpha brute and save in pass
}
if(length($md5) eq 32)		#checking condition call
{$hash = md5_hex($pass);}
elsif(length($md5) eq 40)	#checking condition call
{$hash = sha1_hex($pass);}
elsif(length($md5) eq 56)	#checking condition call
{$hash = sha224_hex($pass);}
elsif(length($md5) eq 64)	#checking condition call
{$hash = sha256_hex($pass);}
elsif(length($md5) eq 96)	#checking condition call
{$hash = sha384_hex($pass);}
elsif(length($md5) eq 128)	#checking condition call
{$hash = sha512_hex($pass);}
else{die "$hash     is NOT valid HASH\n";}
$try++;			#it increment the trys of keys
if ($md5 eq $hash)
{
print "\n**FOUND PASSWORD** 		[ $pass ]\n	Tried		 $try passwords \n";
goto mainmenu;		#if forund then go to menu
}
$Brute[0]++;
}while($Brute[$CharSet-1]<length($alpha));	#condition for each length of list and charset
}
goto mainmenu;		#it go to main menu
}
}
sub quit		#define quit
{
exit(1);
}
