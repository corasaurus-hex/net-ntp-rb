# NTP Message Format

    0                                                        31
    ┌──┬────┬────┬──────────────┬──────────────┬──────────────┐
    │LI│ VN │Mode│   Stratum    │Poll Interval │  Precision   │
    ├──┴────┴────┴──────────────┴──────────────┴──────────────┤
    │                       Root Delay                        │
    ├─────────────────────────────────────────────────────────┤
    │                     Root Dispersion                     │
    ├─────────────────────────────────────────────────────────┤
    │                  Reference Identifier                   │
    ├─────────────────────────────────────────────────────────┤
    │                                                         │
    │                Reference Timestamp (64)                 │
    │                                                         │
    │                                                         │
    ├─────────────────────────────────────────────────────────┤
    │                                                         │
    │                Originate Timestamp (64)                 │
    │                                                         │
    │                                                         │
    ├─────────────────────────────────────────────────────────┤
    │                                                         │
    │                 Receive Timestamp (64)                  │
    │                                                         │
    │                                                         │
    ├─────────────────────────────────────────────────────────┤
    │                                                         │
    │                 Transmit Timestamp (64)                 │
    │                                                         │
    │                                                         │
    ├─────────────────────────────────────────────────────────┤
    │                     Key Identifier                      │
    ├─────────────────────────────────────────────────────────┤
    │                                                         │
    │                                                         │
    │                                                         │
    │                                                         │
    │                  Message Digets (128)                   │
    │                                                         │
    │                                                         │
    │                                                         │
    │                                                         │
    │                                                         │
    └─────────────────────────────────────────────────────────┘

## LI = Leap Indicator 

2 bits

    ┌────┬───────┬────────────────────────────────────────┐
    │ LI │ Value │                Meaning                 │
    ├────┼───────┼────────────────────────────────────────┤
    │ 00 │   0   │               no warning               │
    ├────┼───────┼────────────────────────────────────────┤
    │ 01 │   1   │       last minute has 61 seconds       │
    ├────┼───────┼────────────────────────────────────────┤
    │ 10 │   2   │       last minute has 59 seconds       │
    ├────┼───────┼────────────────────────────────────────┤
    │ 11 │   3   │alarm condition (clock not synchronized)│
    └────┴───────┴────────────────────────────────────────┘

## VN = Version Number

3 bits

    ┌──────┬───────┐
    │  VN  │ Value │
    ├──────┼───────┤
    │  00  │   0   │
    ├──────┼───────┤
    │  01  │   1   │
    ├──────┼───────┤
    │  10  │   2   │
    ├──────┼───────┤
    │  11  │   3   │
    └──────┴───────┘

## Mode

3 bits

    ┌──────────┬──────────┬────────────────────────────────────┐
    │   Mode   │  Value   │              Meaning               │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   000    │    0     │              reserved              │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   001    │    1     │          symmetric active          │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   010    │    2     │         symmetric passive          │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   011    │    3     │               client               │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   100    │    4     │               server               │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   101    │    5     │             broadcast              │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   110    │    6     │  reserved for NTP control message  │
    ├──────────┼──────────┼────────────────────────────────────┤
    │   111    │    7     │      reserved for private use      │
    └──────────┴──────────┴────────────────────────────────────┘

## Stratum

8 bits

    ┌────────────┬─────────────────────────────────────┐
    │  Stratum   │               Meaning               │
    ├────────────┼─────────────────────────────────────┤
    │     0      │     unspecified or unavailable      │
    ├────────────┼─────────────────────────────────────┤
    │     1      │primary reference (e.g., radio clock)│
    ├────────────┼─────────────────────────────────────┤
    │    2-15    │secondary reference (via NTP or SNTP)│
    ├────────────┼─────────────────────────────────────┤
    │   16-255   │              reserved               │
    └────────────┴─────────────────────────────────────┘

## Poll Interval

8 bits

Signed integer indicating the maximum interval between successive messages, in seconds to the nearest power of two.

## Precision

8 bits

Signed integer indicating the precision of the local clock, in seconds to the nearest power of two.

## Root Delay

32 bits

Fixed-point number indicating the total roundtrip delay to the primary reference source, in seconds with fraction point between 15 and 16. Can be negative or positive depending on the relative time and frequency offsets. Usually ranges from negative a few ms to positive several hundred ms.