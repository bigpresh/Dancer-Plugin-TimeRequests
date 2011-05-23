package Dancer::Plugin::TimeRequests;

use strict;
use Dancer::Plugin;
use Dancer qw(:syntax);
use Time::HiRes;

our $VERSION = '0.01';

=head1 NAME

Dancer::Plugin::TimeRequests - log how long each request took to process

=head1 DESCRIPTION

A simple Dancer plugin to log how long each request took to process.  Useful to
examine performance.

Future versions will likely add a stats page to show which routes take most
time, etc.


=head1 SYNOPSIS

In your Dancer app, load this module:

    use Dancer::Plugin::TimeRequests

Then, when your app is logging in debug mode, log messages will be generated
showing how logn each request look.

=cut


before sub {
    var request_start_time => Time::HiRes::time();
};

after sub {
    Dancer::Logger::debug(sprintf "Request to %s completed in %.4f",
        request->path,
        Time::HiRes::time() - vars->{request_start_time};
    );
};



=head1 AUTHOR

David Precious, C<< <davidp at preshweb.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-dancer-plugin-timerequests at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dancer-Plugin-TimeRequests>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer::Plugin::TimeRequests


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dancer-Plugin-TimeRequests>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dancer-Plugin-TimeRequests>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Dancer-Plugin-TimeRequests>

=item * Search CPAN

L<http://search.cpan.org/dist/Dancer-Plugin-TimeRequests/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 David Precious.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Dancer::Plugin::TimeRequests
