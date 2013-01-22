Navman GPS
==========

So a while ago I came across a Navman Jupiter 31 GPS module. I've been attempting to use it for fun.

I packaged the spec into the respoitory in case it vanishes on the internet later. The emitted data is
[NMEA 0183](https://en.wikipedia.org/wiki/NMEA_0183) with some propietary Navman stuff added in.
There is some stuff on the protocol at http://www.kh-gps.de/nmea-faq.htm and http://www.kh-gps.de/nmea.faq

TODO:
* Find out if the first date sent _is_ actually UTC, since I was under the impression that GPS used a non
  leap-second-corrected version.
* Attempt to implement the Push-To-Fix as mentioned in the spec, as it would stop the ASCII splurging and
  free up the Arduino's time for other things (like driving a robot).
