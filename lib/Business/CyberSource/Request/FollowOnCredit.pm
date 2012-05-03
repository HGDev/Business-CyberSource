package Business::CyberSource::Request::FollowOnCredit;
use 5.008;
use strict;
use warnings;
use namespace::autoclean;
use Carp;

our $VERSION = '0.004004'; # VERSION

use Moose;
extends 'Business::CyberSource::Request::Credit';
with qw(
	Business::CyberSource::Request::Role::FollowUp
);

__PACKAGE__->meta->make_immutable;
1;

# ABSTRACT: CyberSource Credit Request Object


__END__
=pod

=head1 NAME

Business::CyberSource::Request::FollowOnCredit - CyberSource Credit Request Object

=head1 VERSION

version 0.004004

=head1 SYNOPSIS

	use Business::CyberSource::Request::FollowOnCredit;

	my $req = Business::CyberSource::Request::FollowOnCredit
		->new({
			username       => 'merchantID',
			password       => 'transaction key',
			production     => 0,
			reference_code => 'merchant reference code',
			total          => 5.00,
			currency       => 'USD',
			request_id     => 'capture request_id',
		});

	my $res = $req->submit;

=head1 DESCRIPTION

This object allows you to create a request for a Follow-On credit.

=head1 METHODS

=head2 new

Instantiates a credit request object, see L<the attributes listed below|/ATTRIBUTES>
for which ones are required and which are optional.

=head2 submit

Actually sends the required data to CyberSource for processing and returns a
L<Business::CyberSource::Response> object.

=head1 SEE ALSO

=over

=item * L<Business::CyberSource::Request>

=back

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/xenoterracide/Business-CyberSource/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Caleb Cushing <xenoterracide@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Caleb Cushing.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

