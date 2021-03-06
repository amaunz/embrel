#!/usr/bin/perl 
use strict;
use warnings;

use SVG qw/star/;
use XML::Simple;
use Convert::Color;
use Data::Dumper;
use File::Util;


my $svg= SVG->new(width=>820,height=>600);

my $defs = $svg->defs( id => 'mydefs', );
my $style = $defs->style( type => "text/css", );
$style->cdata_noxmlesc(
q|
svg { font:w3clogofont; font-size:45; stroke-width:1 }
.w3crect { fill:white; stroke:none }
.w3cline { fill:black; stroke:black } 
.bluetext { fill: rgb(0,90,156); ;stroke:rgb(0,90,156); }
.whitetext { fill:white; stroke:white }
.shadowtext { fill:black; stroke:black}             
glyph    { fill: rgb(0,90,156) }
|
);


my $emph_grp=$svg->group(
	id    => 'group_emph',
);
my $line_grp=$svg->group(
	id    => 'group_line',
);
my $grp=$svg->group(
	id    => 'group_y',
);
my $txt_grp=$svg->group(
	id    => 'group_txt',
);


my $infile = shift(@ARGV) or die "no file given";
my $xmlin = XMLin($infile);
my %coor;
my $circcount = 0;
my $triacount = 0;
while( my ($id,$node) = each %{$xmlin->{node}}){
	my $objtype = $node->{objtype} or 0;
	my $xpos    = $node->{x} or die "node has no xpos";
	my $ypos    = $node->{y} or die "node has no ypos";
	my $size    = $node->{size} or next;
	my $color   = $node->{color} or die "node has no color";
	my $ign     = $node->{ignore};
	my $aleph   = $node->{alephfeat};
	$color =~ s/0x//;
	$color = Convert::Color->new("rgb8:$color");
	$color = 'rgb(' . join(',', $color->red, $color->green, $color->blue) . ")";

	if($node->{from_id}){
		$coor{$node->{from_id}} = [$xpos, $ypos];
	}

	if($objtype == 0){
		$circcount ++;
		$grp->circle(cx=>$xpos, cy=>$ypos, r=>$size, id=>$id, style => {fill=>$color, opacity => 0.8});
	}else{
		$triacount ++;
		$size*=0.7;
		my @xv = (-$size  , 0      ,$size);
		my @yv = (-$size/2, $size/2,-$size/2);
		@xv = map{$xpos + $_}@xv;
		@yv = map{$ypos + $_}@yv;
		my $points = $grp->get_path(
			x=>\@xv, y=>\@yv,
			-type=>'polygon',
			-relative=> 1
		);
		my $a = $grp->anchor( 
			id => "a-$id",
			-href => '#',
			'xlink:title' => $id,
		);

		#my ($tid) = $id =~ m/^(.*)\s*p:/;
		my ($tid) = $id =~ m/^(.*?)\s/;
		$tid ||= $id;
		#print "$tid \n";
			$a->polygon(%$points, id=>$id, style => {fill =>$color});
		#if(!$ign || $aleph){
		if(!$ign ){
			$size*=1.8;
			my $width = int(1.0*($size/2)*length($tid));
			my $x     = int($xpos - $width/3);
			my $y     = int($ypos-$size/2);
			$txt_grp->rect(x=>$x, y=>int($y-0.7*$size), width=>$width, height=>int(0.8*$size), style =>{fill=>'white', opacity=>0.9});
			$txt_grp->text( x=>$x, y=>$y, style => {'font-size'=>"${size}px"}, 'text-anchor' => 'start', 'font-stretch' => 'ultra-condensed')->cdata($tid);
		}
	}
}
print "Read $circcount circles and $triacount triangles\n";
my $lineid=0;
while( my ($id,$node) = each %{$xmlin->{node}}){
	my $from = $node->{from_id};
	my $target = $node->{target_id}; # parent
	next unless(defined($from) and defined($target));
	my $sxpos    = $node->{x} or die "node has no xpos";
	my $sypos    = $node->{y} or die "node has no ypos";
	my $parent   = $coor{$target};
	next unless(ref $parent);
	my($txpos, $typos) = @$parent;
	print "line from $from to $target\n";
	$line_grp->line(id=>"l" . $lineid++, x1 => $sxpos, y1=> $sypos, x2=>$txpos, y2=>$typos, style =>{'stroke' => '#DDDDDD', 'stroke-width' => 1});
}
while( my ($id,$node) = each %{$xmlin->{node}}){
	next unless (defined $node->{alephfeat});
	next if     ($node->{alephfeat} eq '0');
	my $objtype = $node->{objtype} or 0;
	my $xpos    = $node->{x} or die "node has no xpos";
	my $ypos    = $node->{y} or die "node has no ypos";
	my $size    = $node->{size} or die "node has no size";
	my $color   = 'rgb(255,0,0)';
	print "Emph at : $xpos $ypos size $size\n";
	$emph_grp->circle(cx=>$xpos, cy=>$ypos, r=>int(1.5*$size), id=>"emph-$id", style => {fill=>$color, opacity => 0.3});
}

my($fu) = File::Util->new();

my $outfile = $infile;
$outfile =~ s/\.xml/.svg/;
my $path = $fu->return_path($outfile);
my $picname = $fu->strip_path($outfile);
$picname =~ s/\.svg/.png/;
my $grpstr = ""
	#. $line_grp->xmlify 
	. $emph_grp->xmlify 
	. $grp->xmlify;
my($templ) = $fu->load_file('svg/index.svg');
$templ =~ s/\(IMAGESMALL\)/$picname/;
$templ =~ s/\(IMAGEWIDTH\)/800/g;
$templ =~ s/\(IMAGEHEIGHT\)/600/g;
$templ =~ s/\(IMAGEITSELF\)/$grpstr/;


print "Writing $outfile\n";
$fu->write_file(
	'file' => $outfile,
	'content' => $templ,
);
$outfile =~ s/\.svg/-static.svg/;
$fu->write_file(
	'file' => $outfile,
	'content' => $svg->xmlify,
);

`rm -rf $path/js`;
#`cp -r  svg $path/js`;
