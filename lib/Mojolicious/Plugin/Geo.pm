package Mojolicious::Plugin::Geo;
use Mojo::Base 'Mojolicious::Plugin';
use Mojo::UserAgent;

our $VERSION = '0.01';

sub register {
    my ($self, $app) = @_;

    $app->helper(geo => sub {
        my ($self,$ip) = @_;

        my $ua = Mojo::UserAgent->new;      

        my $ip_info = $ua->get('http://geo.serving-sys.com/GeoTargeting/ebGetLocation.aspx?ip=' . $ip)->res->body;  
        my %data = map  { (split /=/, $_) } split(/&/, $ip_info);       

        return \%data;
    });
}

1;
__END__

=head1 NAME

Mojolicious::Plugin::Geo - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('geo');

  # Mojolicious::Lite
  plugin 'geo';

=head1 DESCRIPTION

L<Mojolicious::Plugin::Geo> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::Geo> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 C<register>

  $plugin->register;

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
