package WebService::PagerDuty;

use Modern::Perl;
use Mouse;

# ABSTRACT: WebService::PagerDuty - an interface to PagerDuty's RESTful Web API using Web::API

# VERSION

with 'Web::API';

=head1 SYNOPSIS

Please refer to the API documentation at L<https://v2.developer.pagerduty.com/docs/rest-api>

    use WebService::PagerDuty;
    use Data::Printer;
    
    my $pd = WebService::PagerDuty->new(
        debug   => 1,
        api_key => ''w_8PcNuhHa-y3xYdmc1x',
    );
    
    p $pd->oncalls;

=head1 SUBROUTINES/METHODS

=head2 method

=cut

has 'commands' => (
    is      => 'rw',
    default => sub {
        {
            # abilities
            abilities    => {},
            test_ability => { path => 'abilities/:id' },

            # oncalls
            oncalls => {},

            # users
            users => {},
        };
    });

=head1 INTERNALS

=cut

sub commands {
    my ($self) = @_;
    return $self->commands;
}

=head2 BUILD

basic configuration for the client API happens usually in the BUILD method when using Web::API

=cut

sub BUILD {
    my ($self) = @_;

    $self->user_agent(__PACKAGE__ . ' ' . $WebService::PagerDuty::VERSION);
    $self->strict_ssl(1);
    $self->api_version(2);
    $self->header->{Accept} =
        "application/vnd.pagerduty+json;version=" . $self->api_version;
    $self->content_type('application/json');
    $self->base_url('https://api.pagerduty.com');
    $self->auth_type('header');
    $self->error_keys(['error.message']);
    $self->retry_http_codes([ 408, 500 ]);

    return $self;
}

=head1 BUGS

Please report any bugs or feature requests on GitHub's issue tracker L<https://github.com/<github_user>/WebService::PagerDuty/issues>.
Pull requests welcome.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WebService::PagerDuty


You can also look for information at:

=over 4

=item * GitHub repository

L<https://github.com/<github_user>/WebService::PagerDuty>

=item * MetaCPAN

L<https://metacpan.org/module/WebService::PagerDuty>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WebService::PagerDuty>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WebService::PagerDuty>

=back


=head1 ACKNOWLEDGEMENTS

=over 4

=item * Lenz Gschwendtner (@norbu09), for being an awesome mentor and friend.

=back

=cut

1;    # End of WebService::PagerDuty
