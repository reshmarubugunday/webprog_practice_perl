#Name:Reshma Rubugunday
#StudentId:00001190080
#!/usr/bin/perl
  use Fcntl;
 
  use Text::CSV;

  print "content-type: text/html \n\n"; #The header
  my $file = "cellphones.csv";
  $i = 0;
  my @value;
  open my $fh, "<", $file or die "$file: $!";

  my $csv = Text::CSV->new ({
      binary    => 0, # Allow special character. Always set this
      auto_diag => 1, # Report irregularities immediately
      });
  while (my $row = $csv->getline ($fh)) {
      if(!(@$row[0] =~ m/^#/)){
            push(@value,@$row[0]);
	    push(@value,@$row[1]);
            push(@value,@$row[2]);
      }   
      }
$size = @value;
@a = (0,0,0);
 for ($i = 1; $i < $size; $i=$i+3) 
 {
      if ($value[$i] =~ m"IOS"){
	 $a[0] = $a[0] + $value[$i + 1];
 	}
      if ($value[$i] =~ m"Android"){
	 $a[1] = $a[1] + $value[$i + 1];
 	}
      if ($value[$i] =~ m"Windows"){
	 $a[2] = $a[2] + $value[$i + 1];
 	}
}

$w1 = $a[0]/10;
$w2 = $a[1]/10;
$w3 = $a[2]/10;

sysopen (HTML, 'Output file_1190080.html', O_RDWR|O_CREAT, 0777);
printf HTML "<html>\n"; 
printf HTML "<head>\n"; 
printf HTML "<title>MyCreations</title>"; 
printf HTML "<style>\n";
printf HTML "body{background:#c0d6e4; max-width:100%;}\n";
printf HTML "#ds{font-family:'Calibri', cursive, sans-serif; font-size:36px; text-align:center;}\n";
printf HTML "div{height:400px; width:65%; margin-left:15%; padding-left:5%;}\n";
printf HTML ".cellphones{font-family:'Calibri', Helvetica, sans-serif; font-size:22px;}\n";
printf HTML ".cellphones1{font-family:'Calibri', Helvetica, sans-serif; font-size:2vw;}\n";
printf HTML "</style>\n";
printf HTML "</head>\n";  
printf HTML "<p id='ds'>The Summary of the Survey Results Of Usage Numbers Of Cell phones In Academic Institutions:</p>";

printf HTML "<div>";
printf HTML "<fieldset>";
printf HTML "<legend>Survey Results</legend>\n";
printf HTML "<svg width='100%' height='100%' version='1.1' xmlns='http://www.w3.org/2000/svg'>" ;

printf HTML "<text x='10' y='75' dy='2em' fill='black' class='cellphones'>IOS</text>\n";
printf HTML "<rect x='100' y='50' height='100' fill='#535769' width='$w1%'/>"; 
printf HTML "<text x='100' y='75' dy='2em' fill='black' class='cellphones1'>$a[0]</text>\n";
printf HTML "<text x='10' y='175' dy='2em' fill='black' class='cellphones'>Android</text>\n";
printf HTML "<rect x='100' y='150' height='100' fill='#6f8392' width='$w2%'/>"; 
printf HTML "<text x='100' y='175' dy='2em' fill='black' class='cellphones1'>$a[1]</text>\n";
printf HTML "<text x='10' y='275' dy='2em' fill='black' class='cellphones'>Windows</text>\n";
printf HTML "<rect x='100' y='250' height='100' fill='#9bbabf' width='$w3%'/>"; 
printf HTML "<text x='100' y='275' dy='2em' fill='black' class='cellphones1'>$a[2]</text>\n";

printf HTML "</svg>"; 
printf HTML "</fieldset>\n\n";
printf HTML "</div>\n";
printf HTML "</body>\n"; 
printf HTML "</html>\n"; 



close (HTML);

  close $fh;
