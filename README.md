# Theatre Calendar Parsers

There are so many great theatres in Chicago, but most of their calendars of events are impressively bad. So, this script -- run as a Rack app -- will parse them and re-export them as iCal calendars. That way, Google Calendar will read them and update automatically. Huzzah!

## How to Use

Visit the app (currently living at http://powerful-caverns-1286.herokuapp.com/), and click on the theatre you want a calendar for. In Google Calendar, click on Other Calendars -> Add by URL, and paste the URL from the calendar. Google Calendar should now automatically feed and update the calendar with events from the chosen venue.

## Todo

- More Theatres
  - Second City
  - iO Theatre (http://ioimprov.com/chicago/schedule/0/9/2012)
  - Carpenter Stage
- Non-Terrible Interface
- Customizable Lookahead Duration
- Blacklist of Events
