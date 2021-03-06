package Business::CyberSource::Response::Role::CVN;
use 5.008;
use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.006005'; # VERSION

use Moose::Role;

use MooseX::SetOnce 0.200001;

use MooseX::Types::CyberSource qw( CvResults _VarcharTen );

has cv_code => (
	isa       => CvResults,
	predicate => 'has_cv_code',
	traits    => ['SetOnce'],
	is        => 'rw',
);

has cv_code_raw => (
	isa       => _VarcharTen,
	predicate => 'has_cv_code_raw',
	traits    => ['SetOnce'],
	is        => 'rw',
);

1;

# ABSTRACT: CVN Role


__END__
=pod

=head1 NAME

Business::CyberSource::Response::Role::CVN - CVN Role

=head1 VERSION

version 0.006005

=head1 ATTRIBUTES

=head2 cv_code

=head2 cv_Code_raw

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/xenoterracide/Business-CyberSource/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Caleb Cushing <xenoterracide@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Caleb Cushing.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

