#!/usr/bin/env perl

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::Geo',
  VERSION_FROM => 'lib/Mojolicious/Plugin/Geo.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '1.78'},
  test         => {TESTS => 't/*.t'}
);
