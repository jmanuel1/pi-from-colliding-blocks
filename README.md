# Calculating pi from elastic block collisions

*A beautiful connection between math and physics.*

This repository contains a Processing 3 sketch that calculates the the momenta
of two blocks colliding with each other and a wall. In this imaginary system,
the wall is to the left of both blocks and never moves. The first block enters
the system from the right, and the second block is initially at rest between
the wall and the first block. All of the collisions are perfectly elastic.

The sketch graphs the 'scaled momenta' of the two blocks in a state space after
each collision. The x-axis is the momentum of the first block divided by the
square root of its mass; the y-axis is the same quantity, but for the second
block. The choice of axes leads to all points lying on a circle centered at the
origin, a consequence of conservation of energy.

If the first block has 100<sup>n</sup> times the mass of the second block, then
the plotted points will split the circle's circumference into
floor(pi*10<sup>n+1</sup>) equal pieces and a small remainder piece.
Equivalently, the number of collisions will be the first n+1 digits of pi.

## Getting started

Install Processing 3 (3.2.3+ should work). Open the `pi_from_blocks` sketch in
the Processing editor and run it. You should then see something like this:

![A sample plot of collisions in the 'scaled monemtum' state
space](docs/img/example-plot.jpg)

`Number of collisions: 31` should be outputted into the console.

## Varying the parameters

The parameters of the system are the following:

* The mass of the first block
* The mass of the second block
* The initial momentum of the first block
* The initial momentum of the second block

You can vary the parameters by editing the `new System(...)` call in `setup()`.
Note that the `System` class makes several assumptions:

* That the second block is in between the first block and the wall
* That if the second block is moving towards the wall, it will collide with the
  wall before it collides with the first block

There may be other assumptions that I've missed. The point is, the class
assumes you want a system like that described at the [beginning of this
README](#calculating-pi-from-elastic-block-collisions).

## License

This code is available under the [MIT License](LICENSE).

## Related links

This repository was inspired by a [3Blue1Brown
video](https://www.youtube.com/watch?v=HEfHFsfGXjs&t=3s).
