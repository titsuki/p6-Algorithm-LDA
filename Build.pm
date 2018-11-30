use LibraryMake;

class Build {
    method build($workdir) {
        my $srcdir = "$workdir/src";
        my %vars = get-vars($workdir);
        %vars<lda> = $*VM.platform-library-name("lda".IO);
        mkdir "$workdir/resources" unless "$workdir/resources".IO.e;
        mkdir "$workdir/resources/libraries" unless "$workdir/resources/libraries".IO.e;
        process-makefile($srcdir, %vars);
        my $goback = $*CWD;
        chdir($srcdir);
        shell(%vars<MAKE>);
        chdir($goback);
    }
}
