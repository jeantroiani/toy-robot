# Toy Robot
[![Code Climate](https://codeclimate.com/github/yoshdog/toy-robot/badges/gpa.svg)](https://codeclimate.com/github/yoshdog/toy-robot)
[![Test Coverage](https://codeclimate.com/github/yoshdog/toy-robot/badges/coverage.svg)](https://codeclimate.com/github/yoshdog/toy-robot)

## Objectives
* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

### Sample Input and Outputs
```ruby
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

### Assumptions
+ 5 x 5 grid, with the position starting at 0 and ending at 4.
+ 0,0 is the South-West corner.
+ the y-axis is north to south
+ the x-axis is east to west
+ In the command file, each new command is on a new line.

### My Solution
My domain model includes six classes: **Robot, Direction, Coordinate, FileParser, Controller, ToyRobot**
+ **Robot** can be placed at a location, move forward, turn left and right and also report its status.
+ **Direction** holds the current direction that the robot is facing in. It has a compass array which will hold the directions it will face if turned left or right.
+ **Coordinate** contains the coordinate of the robot. It has a setter method on the x and y axis so the position can change. It knows the boundaries of the surface and will throw an error if the coordinate is out of bounds.
+ **FileParser** will parse the commands from the file and return an array of commands.
+ **Controller** sends the correct commands to the robot based on the commands array.
+ **ToyRobot** knows all the classes and runs the application.

### Versions
+ Ruby 2.0 or greater
+ Bundler
+ RSpec 3.0 or greater

### How to set it up
```sh
git clone git@github.com:yoshdog/toy-robot.git
cd toy-robot
bundle
```

### How to run it
Subsitute commands.txt with any file which has the commands

```sh
cd toy-robot
./bin/toy_robot commands.txt
```

### How to test it
```sh
cd toy-robot
rspec
```