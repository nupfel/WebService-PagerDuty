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

=head2 abilities

=head2 test_ability

=head2 addons

=head2 install_addon

=head2 delete_addon

=head2 addon

=head2 update_addon

=head2 escalation_policies

=head2 create_escalation_policy

=head2 delete_escalation_policy

=head2 escalation_policy

=head2 update_escalation_policy

=head2 extension_schemas

=head2 extension_schema

=head2 extensions

=head2 create_extension

=head2 delete_extension

=head2 extension

=head2 update_extension

=head2 incidents

=head2 create_incident

=head2 manage_incidents

=head2 merge_incidents

=head2 incident

=head2 update_incident

=head2 incident_log_entries

=head2 notes

=head2 create_note

=head2 status_update

=head2 responder_request

=head2 snooze_incident

=head2 alerts

=head2 manage_alerts

=head2 alert

=head2 update_alert

=head2 priorities

=head2 response_play

=head2 log_entries

=head2 log_entry

=head2 maintenance_windows

=head2 create_maintenance_window

=head2 delete_maintenance_window

=head2 maintenance_window

=head2 update_maintenance_window

=head2 notifications

=head2 oncalls

=head2 schedules

=head2 create_schedules

=head2 preview_schedule

=head2 delete_schedule

=head2 schedule

=head2 update_schedule

=head2 overrides

=head2 create_override

=head2 delete_override

=head2 schedule_oncalls

=head2 services

=head2 create_service

=head2 delete_service

=head2 service

=head2 update_service

=head2 create_integration

=head2 integration

=head2 update_integration

=head2 teams

=head2 create_team

=head2 delete_team

=head2 team

=head2 update_team

=head2 remove_team_escalation_policy

=head2 add_team_escalation_policy

=head2 remove_team_user

=head2 add_team_user

=head2 users

=head2 create_user

=head2 delete_user

=head2 user

=head2 update_user

=head2 user_contact_methods

=head2 create_user_contact_method

=head2 delete_user_contact_method

=head2 user_contact_method

=head2 update_user_contact_method

=head2 user_notification_rules

=head2 create_user_notification_rule

=head2 delete_user_notification_rule

=head2 user_notification_rule

=head2 update_user_notification_rule

=head2 vendors

=head2 vendor

=cut

has 'commands' => (
    is      => 'rw',
    default => sub {
        {
            # abilities
            abilities    => {},
            test_ability => { path => 'abilities/:id' },

            # add-ons
            addons        => {},
            install_addon => {
                path      => 'addons',
                method    => 'POST',
                wrapper   => 'addon',
                mandatory => [ 'type', 'name', 'src' ],
            },
            delete_addon => { path => 'addons/:id', method => 'DELETE' },
            addon        => { path => 'addons/:id' },
            update_addon => {
                path    => 'addons/:id',
                method  => 'PUT',
                wrapper => 'addon',
            },

            # escalation policies
            escalation_policies      => {},
            create_escalation_policy => {
                path      => 'escalation_policies',
                method    => 'POST',
                wrapper   => 'escalation_policy',
                mandatory => [ 'type', 'name', 'escalation_rules' ],
            },
            delete_escalation_policy =>
                { path => 'escalation_policies/:id', method => 'DELETE' },
            escalation_policy        => { path => 'escalation_policies/:id' },
            update_escalation_policy => {
                path    => 'escalation_policies/:id',
                method  => 'PUT',
                wrapper => 'escalation_policy',
            },

            # extension_schemas
            extension_schemas => {},
            extension_schema  => { path => 'extension_schemas/:id' },

            # extensions
            extensions       => {},
            create_extension => {
                path    => 'extensions',
                method  => 'POST',
                wrapper => 'extension',
                mandatory =>
                    [ 'type', 'name', 'extension_objects', 'extension_schema' ],
            },
            delete_extension => { path => 'extensions', method => 'DELETE' },
            extension        => { path => 'extensions/:id' },
            update_extension => {
                path    => 'extensions',
                method  => 'PUT',
                wrapper => 'extension',
            },

            # incidents
            incidents       => {},
            create_incident => {
                path    => 'incidents' => method => 'POST',
                wrapper => 'incident',
                mandatory => [ 'type', 'title', 'service' ],
            },
            manage_incidents => {
                path    => 'incidents',
                method  => 'PUT',
                wrapper => 'incidents',
            },
            merge_incidents => {
                path    => 'incidents/:id/merge',
                method  => 'PUT',
                wrapper => 'source_incidents'
            },
            incident        => { path => 'incidents/:id' },
            update_incident => {
                path    => 'incidents/:id',
                method  => 'PUT',
                wrapper => 'incident',
            },
            incident_log_entries => { path => 'incidents/:id/log_entries' },
            notes                => { path => 'incidents/:id/notes' },
            create_note => { path => 'incidents/:id/notes', method => 'POST' },
            status_update => {
                path      => 'incidents/:id/status_update',
                method    => 'POST',
                mandatory => ['message'],
            },
            responder_request => {
                path   => 'incidents/:id/responder_request',
                method => 'POST',
                mandatory =>
                    [ 'requester_id', 'message', 'responder_request_targets' ]
            },
            snooze_incident => {
                path      => 'incidents/:id/snooze',
                method    => 'POST',
                mandatory => ['duration'],
            },

            # alerts
            alerts        => { path => 'incidents/:id/alerts' },
            manage_alerts => {
                path    => 'incidents/:id/alerts',
                method  => 'PUT',
                wrapper => 'alerts',
            },
            alert        => { path => 'incidents/:id/alerts/:alert_id' },
            update_alert => {
                path    => 'incidents/:id/alerts/:alert_id',
                method  => 'PUT',
                wrapper => 'alert',
            },

            # priorities
            priorities => {},

            # response play
            response_play => {
                path    => 'response_plays/:id/run',
                method  => 'POST',
                wrapper => 'incident',
            },

            # log entries
            log_entries => {},
            log_entry   => { path => 'log_entries/:id' },

            # maintenance windows
            maintenance_windows       => {},
            create_maintenance_window => {
                path      => 'maintenance_windows',
                method    => 'POST',
                wrapper   => 'maintenance_window',
                mandatory => [ 'type', 'start_time', 'end_time', 'services' ],
            },
            delete_maintenance_window =>
                { path => 'maintenance_windows/:id', method => 'DELETE' },
            maintenance_window        => { path => 'maintenance_windows/:id' },
            update_maintenance_window => {
                path    => 'maintenance_windows/:id',
                method  => 'PUT',
                wrapper => 'maintenance_window'
            },

            # notifications
            notifications => {},

            # oncalls
            oncalls => {},

            # schedules
            schedules        => {},
            create_schedules => {
                path      => 'schedules',
                method    => 'POST',
                wrapper   => 'schedule',
                mandatory => [ 'type', 'time_zone', 'schedule_layers' ]
            },
            preview_schedule => {
                path      => 'schedules/preview',
                method    => 'POST',
                wrapper   => 'schedule',
                mandatory => [ 'type', 'time_zone', 'schedule_layers' ],
            },
            delete_schedule => { path => 'schedules/:id', method => 'DELETE' },
            schedule        => { path => 'schedules/:id' },
            update_schedule => {
                path    => 'schedules/:id',
                method  => 'PUT',
                wrapper => 'schedule',
            },
            overrides       => { path => 'schedules/:id/overrides' },
            create_override => {
                path      => 'schedules/:id/overrides',
                method    => 'POST',
                wrapper   => 'override',
                mandatory => [ 'start', 'end', 'user' ],
            },
            delete_override => {
                path   => 'schedules/:id/overrides/:override_id',
                method => 'DELETE',
            },
            schedule_oncalls => { path => 'schedules/:id/users' },

            # services
            services       => {},
            create_service => {
                path      => 'services',
                method    => 'POST',
                wrapper   => 'service',
                mandatory => ['type'],
            },
            delete_service => { path => 'services/:id', method => 'DELETE' },
            service        => { path => 'services/:id' },
            update_service => {
                path    => 'services',
                method  => 'PUT',
                wrapper => 'service',
            },

            # integrations
            create_integration => {
                path      => 'services/:id/integrations',
                method    => 'POST',
                wrapper   => 'integration',
                mandatory => ['type'],
            },
            integration =>
                { path => 'services/:id/integrations/:integration_id' },
            update_integration => {
                path    => 'services/:id/integrations/:integration_id',
                method  => 'PUT',
                wrapper => 'integration',
            },

            # teams
            teams       => {},
            create_team => {
                path      => 'teams',
                method    => 'POST',
                wrapper   => 'team',
                mandatory => [ 'type', 'name' ]
            },
            delete_team => { path => 'teams/:id', method => 'DELETE' },
            team        => { path => 'teams/:id' },
            update_team =>
                { path => 'teams/:id', method => 'PUT', wrapper => 'team' },
            remove_team_escalation_policy => {
                path   => 'teams/:id/escalation_policies/:escalation_policy_id',
                method => 'DELETE',
            },
            add_team_escalation_policy => {
                path   => 'teams/:id/escalation_policies/:escalation_policy_id',
                method => 'PUT',
            },
            remove_team_user =>
                { path => 'teams/:id/users/:user_id', method => 'DELETE' },
            add_team_user =>
                { path => 'teams/:id/users/:user_id', method => 'PUT' },

            # users
            users       => {},
            create_user => {
                path      => 'users',
                method    => 'POST',
                wrapper   => 'user',
                mandatory => [ 'type', 'name', 'email' ],
            },
            delete_user => { path => 'users/:id', method => 'DELETE' },
            user        => { path => 'users/:id' },
            update_user =>
                { path => 'users/:id', method => 'PUT', wrapper => 'user' },

            user_contact_methods => { path => 'users/:id/contact_methods' },
            create_user_contact_method => {
                path      => 'users/:id/contact_methods',
                method    => 'POST',
                wrapper   => 'contact_method',
                mandatory => [ 'type', 'label', 'address' ],
            },
            delete_user_contact_method => {
                path   => 'users/:id/contact_methods/:contact_method_id',
                method => 'DELETE',
            },
            user_contact_method =>
                { path => 'users/:id/contact_methods/:contact_method_id' },
            update_user_contact_method => {
                path    => 'users/:id/contact_methods/:contact_method_id',
                method  => 'PUT',
                wrapper => 'contact_method',
            },

            user_notification_rules =>
                { path => 'users/:id/notification_rules' },
            create_user_notification_rule => {
                path    => 'users/:id/notification_rules',
                method  => 'POST',
                wrapper => 'notification_rule',
                mandatory =>
                    [ 'start_delay_in_minutes', 'contact_method', 'urgency' ],
            },
            delete_user_notification_rule => {
                path   => 'users/:id/notification_rules/:notification_rule_id',
                method => 'DELETE',
            },
            user_notification_rule => {
                path => 'users/:id/notification_rules/:notification_rule_id',
            },
            update_user_notification_rule => {
                path    => 'users/:id/notification_rules/:notification_rule_id',
                method  => 'PUT',
                wrapper => 'notification_rule',
            },

            # vendors
            vendors => {},
            vendor  => { path => 'vendors/:id' },
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
