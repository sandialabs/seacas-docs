#! /usr/local/bin/perl
# Process each line of the file
require "getopts.pl";
# Parse arguments
sub usage {
    print STDERR <<END_OF_USAGE;

Usage: prog2mif [options] [fname]

Options: -h               Print this blurb
         -l language      Use keywords for specified language

END_OF_USAGE
    return 1;
}
&Getopts("hl:");
exit(&usage) unless !$opt_h;
$infile = $ARGV[0];
# Read the file line-by-line doing:
#   - Replace special characters by their MIF representation
#   - Embolden keywords

$infile = "-" unless $infile;
die "Cannot open $infile" unless open(INFILE, "< $infile");

print "<MML -- created by fixtex.pl, la2mml>";
print "<!DefineFont param\n";
print "        <Family Times>\n";
print "        <pts 10>\n";
print "    <Plain><Normal><Italic>\n";
print ">\n";
print "<!DefineFont cmdverb\n";
print "        <Family Helvetica>\n";
print "        <pts 10>\n";
print "    <Plain><Normal><Bold>\n";
print ">\n";
print "<!DefineFont cmd\n";
print "        <Family Helvetica>\n";
print "        <pts 10>\n";
print "    <Plain><Normal>\n";
print ">\n";
print "<!DefineFont pgm\n";
print "        <Family Helvetica>\n";
print "        <pts 10>\n";
print "    <Plain><Normal><Oblique>\n";
print ">\n";
print "<!DefinePar Indent\n";
print "	<rm>\n";
print "	<Alignment LeftRight>\n";
print "	<LeftIndent 0.30\">\n";
print "	<FirstIndent 0.30\">\n";
print "	<RightIndent 0.30\">\n";
print "	<Leading 2pt>\n";
print "	<SpaceBefore 10pt>\n";
print "	<SpaceAfter 0pt>\n";
print "	<Autonumber No>\n";
print "	<Hyphenate Yes>\n";
print ">\n";

while ($_ = <INFILE>) {
    chop;
    # Replace characters which would normally be translated to escape
    # sequences ending with a letter by non-print character so they
    # can still work as word delimiters. The actual escape sequence
    # will be inserted later.
    s/\\\\cmddef /<Indent>/g;
    s/\\\\cmdnext  /<HardReturn>/g;
    s/\\\\cmdverb ([A-Za-z0-9_]+)/<cmdverb>\1<rm>/g;
    s/\\\\cmd ([^ \\]+)/<cmd>\1<rm>/g;
    s/\\\\PGM ([^ \\]+)/<pgm>\1<rm>/g;
    s/\\\\param ([A-Za-z0-9_]+)/<param>\1<rm>/g;
    s/\\\\caps//g;
    s/\\\\setlength.*//g;
    s/\\\\PROGRAM/<pgm>GREPOS<rm>/g;
    s/\\\\CODE/<pgm>GREPOS<rm>/g;
    s/\\\\gen/GENESIS/g;
    s/\\\\exo/EXODUS/g;
    s/\\\\ddd/three-dimensional/g;
    s/\\\\dd/two-dimensional/g;
    s/\\\\nodefault/\\<No Default\\>/g;
    s/\\\\default (.*)([^\n])/\\<\1\2\\>/g;
    s/\\\\cenlinesbegin/\n<Code>/g;
    s/\\\\cenlinesend/\n<Body>/g;
    # Print the MIF line
    print $_,"\n";
}
exit(0);
