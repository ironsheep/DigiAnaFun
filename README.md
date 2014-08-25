# DigiAnaFun

Digital Clock made up of Analog Clock faces - iPhone now, iPad
shortly...

### How’d this Happen?

Wandering the web, I saw an Artists work… was intrigued! I reviewed
videos until I understood how each digit was formed (and planned a few
more shapes) then… one day, in my mind’s eye, I saw how the code should
be organized.

### Then, i sat down to my machine...

I sat down to my machine, started an Xcode project, fired up Photoshop
to build some analog clock face "rudimentary parts" and also to generate
a quick app-icon from a well known [icon template][]… and a short "**4
hours**" later I had this app working in it’s present form! What a fun
project and easy reminder that moving from concept thru to complete
implementation is just getting easier and faster after years of practice
with Objective-C and Xcode!

### The Artist:

<http://www.humanssince1982.com/>

### Videos:

<http://vimeo.com/52798481>

<http://vimeo.com/12421714>

<http://vimeo.com/47249375>

### My Mind’s Eye:

It’s a well behaved collection of analog clocks! However...

-   If you look closely at the analog faces some of the time’s shown
    can’t really happen with a normal analog clock since the hour hand
    moves partial distances between the hour marks according to the
    number of minutes past the hour. So, we have to detune this
    behavior.

<!-- -->

    Object: 
     - animated analog clock, with 
     - special detune control to not move hour hand due to minutes after
        the hour (enable/disable) and
     - time-set control: so the analog clock can animate from present position to 
        a specific time.

-   Next group’s of six analog clocks behave in concert to show a single
    digit. So we’ve a Digit Controller which controls the behavior of 6
    analog clocks to present a single numeric digit. Next each analog
    clock in the 6 clock matrix goes to a different time so it can
    represent its part of the digit. So, we need a table of times (one
    for each of the six analog clocks) for each digit (0-9) that we want
    to display. Lastly we need to be able to tell the digit controller
    what digit to display.

<!-- -->

    Object: 
     - Digit Controller - controls six analog clocks in 2x3 matrix with
     - table of times, one for each clock, indexed by digit needing to be displayed.
     - lastly, digit-set control: so the matrix can slew from present digit displayed 
        to next desired digit

-   Now to make this a clock of clocks, we teach our view controller to
    determine the current time in 24-hour format and then to tell each
    of the digit matrices to slew to it’s respective digit of the 24
    hour time.

-   *Of course, when you see the app in action, you’ll notice that I
    also added some controls so we can have fun making the digits move
    because after seeing them the first time who doesn’t want to make
    them move?!!!*

This all make sense?

#### Copyright

The code and graphics for this project are © 2014, Iron Sheep
Productions, LLC

#### License

This source is distributed under the [MIT License][]

  [icon template]: http://appicontemplate.com/
  [MIT License]: https://github.com/ironsheep/DigiAnaFun/blob/master/LICENSE
