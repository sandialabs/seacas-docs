$ VERIFY = F$VERIFY("NO")
$!
$! DISTR creates distribution lists for SAND reports, memos, etc.
$! The master distribution list is in DISTRIBUTION.RNO.
$! Lists are in the TEX format format.
$!    P8 is the directory
$!
$ IF P8 .NES. "" THEN SET DEFAULT 'P8'
$!
$ DISTRFILE = "DISTRIBUTION"
$!
$ IF F$SEARCH("''DISTRFILE'.RNO") .NES. "" THEN GOTO FILEOKAY
$    WRITE SYS$OUTPUT BELL, "''DISTRFILE'.RNO does not exist"
$    GOTO END
$FILEOKAY:
$!
$ TYPE1 = "SAND"
$ TYPE2 = "INTER"
$ TYPE3 = "MEMO"
$ TYPE4 = ""
$!
$ NUM = 1
$LOOP:
$ IF (TYPE'NUM' .EQS. "") THEN GOTO DONE
$    FILETYPE = TYPE'NUM'
$    NEWFILE = "DISTR" + FILETYPE
$!
$    WRITE SYS$OUTPUT "Creating new ''NEWFILE'.TEX"
$    DELETE texmisc:'NEWFILE'.TEX;*
$    RUNOFF/VARIANT="''FILETYPE'" 'DISTRFILE'
$    MEMTEXT 'DISTRFILE'.MEM texmisc:'NEWFILE'.TEX
$!
$    DELETE 'DISTRFILE'.MEM;*
$!
$    NUM = NUM + 1
$    GOTO LOOP
$DONE:
$!
$END:
$ IF VERIFY THEN SET VERIFY
