use strict;
use Bio::SeqIO;

my $s;
my $in;
my $st;

sub input {
   my $inputfile;
   my $fin;
   open(my $inputfile, '<:encoding(UTF-8)', @_[0])
     or die "Could not open file '@_[0]' $!";
   $fin = <$inputfile>;
   $s = <$inputfile>;
   chomp($fin);
   chomp($s);
   $in = Bio::SeqIO->newFh(-file => "<$fin", -format => 'fasta');
   return;
}

sub run {
   return;
}

sub output {
   my $out = Bio::SeqIO->new(-file => ">@_[0]", -format => 'fasta');
   my $seq;
   while ($seq = <$in>) {
    if ($seq->desc() =~ $s) {
        $out->write_seq($seq);
    }
   }
   
   return;
}



