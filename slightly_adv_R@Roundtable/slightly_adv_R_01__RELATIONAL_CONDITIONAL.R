###################
##  Control Flow ##
###################


## 01: Equality and greater or less ####

#   How does one thing (in R: object) relate to another?
#   R operator to enquire for equality of two objects:  ==
#   Output will be TRUE or FALSE.

# Ask R whether 4 is the same as 12 / 3

# Ask R if 3 * 3 = 4

# Ask whether TRUE is the same as FALSE

# And enquire whether "winter" is the same as "summer"

# Is 6 > 56?

# Or is it smaller?

# Check out if "summer" is greater than "winter" (and reconsider why)

# ...and whether TRUE is less than FALSE

# But is it greater or equal than FALSE?


## 02: Equality of vectors and matrixes ####

# Here's two vectors, with counts of tiger sharks and hammerhead sharks
# on nine consecutive days:
tiger  <-  c(0, 4, 1, 1, 4, 5, 2, 0, 9)
hammerheads  <-  c(1, 2, 4, 5, 2, 0, 1, 1, 4)

# On which days were there no tiger sharks in the water?

# And on which days would you find more than 2 tiger sharks?

# Check out when there were more hammerhead than tiger sharks.


# Combining both vectors into a matrix:
sharks <- matrix(c(tiger, hammerheads), nrow = 2, byrow = TRUE)

# Explore that matrix. Use subsetting [..., ..., ...] to find out how many 
# hammerhead sharks were in the water on day 3.

# In one command: When was a single individual of tiger or hammerhead sharks observed?

# On which days were there more than 2 tigers and/or hammerheads counted?

# When were there more hammerheads counted than tiger sharks?


## 03: Logical operators ####

# Is 12 smaller than 45 and greater than 24/3 ?

# Is 12 smaller than 45 and smaller than 24/3?


## Logical operators and vectors ##

# Are the counts of tiger sharks on the second day between 2 and 5 (exclusive)?

# What about hammerhead sharks (inclusive)?

# Are tiger shark sightings on day 6 smaller than 2 or larger than 5 (exclusive)?


## 04 Logical operators and matrices ####

# When was more than one tiger shark, but no hammerhead shark counted?

# When were 2 or more specimen of both species counted simultaneouly?

# On which days were there 4 individuals of one or both species?

# For which species and days in the sharks matrix is the count between 3 (inclusive)
# and 5 (exclusive)?

# Think before you execute:
# What will be the output of 
v1 <- 12
v2 <- 7
!(!(v1 < 6) & !!(v2 > 17))

## Here are some more sharks for your matrix:
lemon <- c(5, 4, 1, 1, 3, 5, 2, 8, 8)
bull <- c(3, 3, 6, 1, 9, 0, 2, 0, 8)
blacktip <- c(0, 1, 2, 1, 4, 0, 2, 0, 2)
cookiecutter <- c(1, 0, 2, 2, 0, 0, 1, 0, 3)
sharks <- matrix(c(tiger, hammerheads, lemon, bull, blacktip, cookiecutter),
                 nrow = 6, byrow = TRUE)
colnames(sharks) <- paste0('day_', seq(from = 1, to = dim(sharks)[2]))
rownames(sharks) <- c("tiger", "hammerheads", "lemon", "bull", "blacktip", "cookiecutter")
sharks

# Save counts for all species on day 5 in a vector. Print the vector to the console.

# Use that day 5 vector to create a new vector that is TRUE for counts below 2
# or above 4 (both inclusive). Again, print that vector to the console.

# Using that vecor, count how often these particularly high or low counts
# occured on day 5. That means: use the sum() function to count the numbers
# of TRUE in the vector created above. The sum() function does that pretty
# much automatically.

# And now solve it all in one single line of code.

