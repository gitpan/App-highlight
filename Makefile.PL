
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A simple grep-like filter that highlights chosen words or lines rather than removing non-filtered lines.",
  "AUTHOR" => "Alex Balhatchet <kaoru\@slackwise.net>",
  "BUILD_REQUIRES" => {
    "App::Cmd::Tester" => "0.309",
    "Test::More" => "0.92",
    "Test::Without::Module" => "0.17"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-highlight",
  "EXE_FILES" => [
    "bin/highlight"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::highlight",
  "PREREQ_PM" => {
    "App::Cmd::Simple" => "0.309",
    "ExtUtils::MakeMaker" => "6.55_02",
    "Getopt::Long::Descriptive" => "0.085",
    "Module::Load" => "0.18",
    "Try::Tiny" => "0.09"
  },
  "VERSION" => "0.09",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



