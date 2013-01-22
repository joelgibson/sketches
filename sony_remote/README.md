sony remote
===========

It turns out that Sony has a [rather nice infared protocol][ssirc] for communicating with its devices.
I wrote this small sketch to implement the Sony remote protocol on the Arduino.

It requires a 2-pin IR LED attached to pin 3 (with an appropriate resistor, of course). The reason for
using pin 3 rather than the more standard pin 13 is because I wrote a version of this to use the timer
registers on the Arduino, not accessible from pin 13.

[ssirc]: https://github.com/joelgibson/sketches/raw/master/sony_remote/sonysirc.pdf
