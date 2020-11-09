## A triangular ("christmas tree"-style) 12-hour clock in Nim using SDL2

Compile with

```nim c christmas```

The bottom triangle is a triangular hour/minute clock as proposed by [Jörg Pretz](https://arxiv.org/pdf/1006.1373.pdf) in 2010: the five lower rows (from top to bottom) are in units of 6 h, 2 h, 30 m, 6 m, and 1 m, respectively.

The upper triangle indicates seconds: First, there is a yellow seconds indicator as on the [Berlin clock](https://en.wikipedia.org/wiki/Mengenlehreuhr) (blinks yellow when seconds are even), and the three following rows are in units of 20 s, 5 s, and 1 s, respectively.

At 12 am and 12 pm, the hours/minutes indicator at the bottom goes dark. So 12 o'clock is depicted as 0 hours.

Window size is fixed at 900x500 pixels.

The time in the screenshot below is 10:28:10:

![screenshot](https://github.com/mdoege/nim-christmas/raw/master/screenshot.png "nim-christmas screenshot")
