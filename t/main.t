use Kelp::Base -strict;
use Kelp;
use Test::More;

# Basic
{
    my $app = Kelp->new();
    can_ok $app, $_ for qw/json/;
    is ref $app->json, 'JSON::XS';
}

done_testing;
