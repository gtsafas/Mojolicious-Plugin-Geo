#!/usr/bin/env perl
use Mojolicious::Lite;
use Mojolicious::Plugin::Geo;

# Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
plugin 'pod_renderer';
plugin 'geo';

get '/welcome' => sub {
  my $self = shift;
  $self->render('index');
};

get '/test' => sub {
  my $self = shift;
  
  $self->render({ json => $self->geo('8.8.8.8') });
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
Welcome to Mojolicious!

@@ layouts/default.html.ep
<!doctype html><html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
