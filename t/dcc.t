use strict;
use warnings;
use Test::More;
use Test::Exception;
use Test::Requires::Env qw(
	PERL_BUSINESS_CYBERSOURCE_USERNAME
	PERL_BUSINESS_CYBERSOURCE_PASSWORD
);

my ( $cybs_id, $cybs_key )
	= (
		$ENV{PERL_BUSINESS_CYBERSOURCE_USERNAME},
		$ENV{PERL_BUSINESS_CYBERSOURCE_PASSWORD},
	);

use Business::CyberSource::Request::DCC;
use Business::CyberSource::Request::Authorization;

my $dcc_req;
lives_ok {
	$dcc_req = Business::CyberSource::Request::DCC->new({
		username       => $cybs_id,
		password       => $cybs_key,
		production     => 0,
		reference_code => 't501',
		currency       => 'USD',
		credit_card    => '4205260000000005',
		cc_exp_month   => '04',
		cc_exp_year    => '2012',
		total          => '1.00',
		foreign_currency => 'JPY',
	})
} 'DCC object initialized';

	note( '!!!: if this fails please ensure that cybersource has enabled DCC '
		. 'for your account' )
		;

	my $dcc;
	lives_ok {
		$dcc = $dcc_req->submit;
	} 'DCC submitted';

	ok ( $dcc_req->trace, 'trace exists' );

	ok( $dcc, 'authorization response exists' );

	note( $dcc_req->trace->request->decoded_content );
	note( $dcc_req->trace->response->decoded_content );

	ok( $dcc->reference_code, 'reference code exists' );
	is( $dcc->request_specific_reason_code, 100, 'DCC Reason code is 100' );
	is( $dcc->foreign_currency, 'JPY', 'check foreign currency' );
	is( $dcc->foreign_amount, 116, 'check foreign amount' );
	is( $dcc->currency, 'USD', 'check currency' );
	is( $dcc->dcc_supported, 1, 'check dcc supported' );
	is( $dcc->exchange_rate, 116.4344, 'check exchange rate' );
	is( $dcc->exchange_rate_timestamp, '20090101 00:00', 'check exchange timestamp' );
	ok( $dcc->valid_hours, 'check valid hours exists' );
	is( $dcc->margin_rate_percentage, '03.0000', 'check margin rate percentage' );

done_testing;