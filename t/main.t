use Kelp::Base -strict;
use Kelp;
use Kelp::Test;
use HTTP::Request::Common;
use Test::More;

# Basic
{
    my $app = Kelp->new();
    can_ok $app, $_ for qw/json/;
    is ref $app->json, 'JSON::XS';

    my $json = { a => 'утф8' };
    $app->add_route(
        '/json',
        sub {
            $json
        }
    );

    my $t = Kelp::Test->new( app => $app );
    $t->request( GET '/json' )->json_cmp($json);
}

done_testing;
