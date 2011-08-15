package Business::CyberSource::Request::Role::CreditCardInfo;
use 5.008;
use strict;
use warnings;
use Carp;
BEGIN {
	our $VERSION = 'v0.1.0'; # VERSION
}
use Moose::Role;

has credit_card => (
	required => 1,
	is       => 'ro',
	isa      => 'Str',
);

has cc_exp_month => (
	required => 1,
	is       => 'ro',
	isa      => 'Str',
);

has cc_exp_year => (
	required => 1,
	is       => 'ro',
	isa      => 'Str',
);

sub _build_credit_card_info {
	my ( $self, $sb ) = @_;

	my $card = $sb->add_elem(
		name => 'card',
	);

	$sb->add_elem(
		name   => 'accountNumber',
		value  => $self->credit_card,
		parent => $card,
	);

	$sb->add_elem(
		name   => 'expirationMonth',
		value  => $self->cc_exp_month,
		parent => $card,
	);

	$sb->add_elem(
		name   => 'expirationYear',
		value  => $self->cc_exp_year,
		parent => $card,
	);

	return $sb;
}

1;

# ABSTRACT: credit card info role

__END__
=pod

=head1 NAME

Business::CyberSource::Request::Role::CreditCardInfo - credit card info role

=head1 VERSION

version v0.1.0

=head1 AUTHOR

Caleb Cushing <xenoterracide@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Caleb Cushing.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
