
# -----------------------------------------------------------------------------
# Title: First steps in R

# Description: This script demonstrates some very basic functionalities and 
#  concepts of R
#  1) Calculations with R
#  2) Objects
#  3) Functions

# Author: Simon Knüsel

# Date: 2019-10-07
# -----------------------------------------------------------------------------


# 1) Calculations with R --------------------

5 + 3
10 - 4
4 * 7


# 2) Objects --------------------

## To assign a value to an object always use "<-"

# assign value 42 to x
x <- 42
x

# assign value 50 to y
y <- 50
Y # throws error because R is case sensitive
y

# calculate our_height (my_height + your_height)
my_height <- 175
your_height <- 180

our_height <- my_height + your_height
our_height


# Object names ------
## Object names should always be in lower case, connected words should be 
## separated with an underscore (_)

ObjectName <- 5 # This is a bad example
object_name <- 5 # This is a good exmaple


# 3) Functions --------------------
## See also documentation in the 02_Slides folder

## Functions take inputs via arguments, transform the input(s) and 
## return an output
## Functions have mandatory and optional arguments

# "x" is a mandatory argument, "times" is an optional argument
rep(x = 4, times = 3)

# get help for functions (?function_name)
?rep
