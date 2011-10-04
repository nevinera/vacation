# Vacation

Basic vacation time tracker for a small company.

First person to sign up with a given company name becomes the manager for that company
(but can give that position to another member of the company later).

Users submit a time-off request in advance (or after the fact, but it would be rude..),
and the manager either accepts the request, delays the request, or closes the request with a message
explaining.

Vacation time is represented as a linearly increasing value - for record keeping, you just put in
how much vacation time each employee has at some specific point in time, and how much vacation they get per year.
That amount can be changed, and the altered rate will go into effect on the date given (not the date saved).

The total vacation available right now, or at any point in the future can be easily calculated, or displayed
as a graph.

Planned vacations can be in any of these states:

1. Planned - for your use only; no notifications sent, and plans are cancelled automatically when their time comes.
2. Requested - a plan that you want permission for; this asks the manager to accept your plan,
3. Accepted - a plan that the manager has accepted. These can be cancelled at will, but doing so notifies the manager.
4. Happened - a plan that actually happened - this is in the past, and counts on your total vacation time.
5. Missed - a plan that was supposed to happen, but didn't end up happening for some reason. Changing a plan from Happened to Missed can only be done by the manager.


Note - a vacation has a start and end time, but the *duration* is the important number, and probably won't match.
If I take a vacation from friday morning through tuesday afternoon, `end - start` will be about 4 days, 
but the duration should only be about 20 hours (of work time missed).


