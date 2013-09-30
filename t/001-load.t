use strict;
use warnings;

use Test::More tests => 4;

BEGIN {
    use_ok('XML::Catalog');
}

diag("Testing XML::Catalog $XML::Catalog::VERSION");

my $catalog = XML::Catalog->new('t/oasis.cat');
isa_ok( $catalog, 'XML::Catalog', 'Check ISA' );

my $pubid = '-//OASIS//TEST DTD//EN';
my $file  = $catalog->resolve_public($pubid);

is( $file, 'file://./t/test.dtd', 'Reslove PublicID' );

SKIP: {
    skip( 'delegation not working ... ', 1 );
    $pubid = '-//OASIS//TEST 2 DTD//EN';
    $file  = $catalog->resolve_public($pubid);

    is( $file, 'file://./t/test.dtd', 'Reslove PublicID' );
}

