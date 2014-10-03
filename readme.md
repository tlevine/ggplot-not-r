How I think about plotting
===============================
I have a certain way of thinking about plots. Let's see if I can
teach it to you. I've prepared a toy project and some videos and
readings. If this sounds like something you'd like to learn, follow
the directions below.

This should also serve as a good introduction to ggplot2 and to R.

## How I think about plotting
I define "plotting" thusly.

> Plotting is the process of mapping abstract data to concrete
> things that we can perceive.

Perhaps that will make more sense by the time you're finished with this
little tutorial. As you go through the various materials below, try to
keep the following points in mind.

1. Data are abstract and do not have a fundamental representation
    in the real world.
2. We map abstract data onto concrete things in the real world so
    that we can undersand the abstract data.
3. In order to make good plots, we have to choose mappings that
    people understand.

## Read these slides
While I have a particular way of thinking about plotting, I haven't
really written it up anywhere; the closest thing to that is
[these slides](data-visualization-needs-to-die.pdf), which I would
like you to read. They were part of a talk that wasn't recorded, so
don't expect to understand it all. 

The main thing that you should pay attention to, for now, is how
abstract data can be mapped to things other than graphics, per my
definition of "plotting".

The other thing you might pay attention to is the value of representing
many different variables at once.

## Watch this video
I haven't written much about how I think about plotting, so I can't
give you much more that I have written. On the other hand, many people
have inspired this way of thinking, so maybe you can just read their
writings and watch their videos.

My definition of plotting is based largely on ggplot2 and the Grammar
of Graphics, by Hadley Wickham and Leland Wilkinson, respectively.
My insistance on representing many dimensions comes largely from
Edward Tufte and from experiment design theory. And my views on making
graphics that are visually interesting, coherent, and generally "good"
come largely from Edward Tufte and Timothy Samara.

I'll give you many references later. For now, just watch
[this video](https://www.youtube.com/watch?v=TaxJwC_MP9Q)
until you get bored. Alternatively, you can read through
[these slides](http://ggplot2.org/resources/2007-vanderbilt.pdf).

## Set up your computer
Now let's also see if you can learn a bit about ggplot2 without learning R.
(Well, actually, I already know that you totally can.)

I do assume, however, that you have installed R, you can open it. And
it would be nice if you could write simple SQL, but it's probably fine
if you don't.

## Toy project
[treasury.io](http://treasury.io) provides a daily feed of deposits
and withdrawals from different accounts within the federal treasury.
You can download the full historical feed as a SQLite3 database.

    wget http://api.treasury.io/cc7znvq/47d80ae900e04f2/http/treasury_data.db

Here's a [codebook](https://github.com/csvsoundsystem/federal-treasury-api/wiki/Treasury.io-Data-Dictionary).

You are going to play around with these data and make some plots.
It's probably easiest if you come up with an arbitrary question for yourself,
like "How does spending differ between Tuesdays and Thursdays?"

Base your code on [`treasury.r`](treasury.r) so that you don't have to know
how R works. Query the data with the `sqldf` function, and then pass the
results of those queries to the `ggplot` function to make plots.

Start out by changing the contents of the `aes` function call and by
adding geoms other than `geom_point`. Look at the
[ggplot2 documuentation](http://docs.ggplot2.org/current/),
but ignore the parts that you don't understand.

Don't worry about making particularly pretty plots; just try to make plots
that tell you something about the treasury.

## When you get bored
Here are a few directions you can go when you get tired of the above
toy project.

### Use your own data
If I were you, I'd probably just want to start playing with my own data.
Figure out how to load you data into R, and then start plotting it.

### Make your graphs look better.
In general, if you want to make something interesting, follow most of
the rules and then break one or two.

You can read *Design Elements*, by Timothy Samara, or you can just read
this [summary](http://www.behance.net/gallery/Book-Layout-Timothy-Samaras-20-Rules-of-Good-Design/7616553)
of the rules.
Then try appling these design elements to your plots.

There are some special rules for visual displays of quantitative information.
You can read about them in any of Edward Tufte's books, such as
*The Visual Display of Quantitative Information*. Here are two main concepts
to try to understand

* Data:ink ratio
* Escaping Flatland (presenting multivariate data)

### More about the Grammar of Graphics
Once you start seeing plots as mappings between abstract data and concrete
elements, different plots start seeming much more similar. Look at a few
plots, such as [these](http://www.edwardtufte.com/tufte/), and deconstruct
them into their grammatical components.

* `DATA`
* `TRANS`
* `SCALE`
* `COORD`
* `GUIDE`

## More things you can read

### Day 1

* The Grammar of Graphics, by Leland Wilkinson
http://ggplot2.org/resources/2007-past-present-future.pdf

### Day 2

* Design Elements, by Timothy Samara
* [R Spells for Data Wizards](http://thomaslevine.com/!/r-spells-for-data-wizards/)
* [Intro to R](http://www.youtube.com/playlist?list=PLOU2XLYxmsIK9qQfztXeybpHvru-TrqAP) videos
* [R-bloggers](http://www.r-bloggers.com/)
* Like Python, [R is for wizards](http://www.matthewckeller.com/Lecture1.ppt)
