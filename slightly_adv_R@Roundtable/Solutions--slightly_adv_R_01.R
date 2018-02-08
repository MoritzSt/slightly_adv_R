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

# Explore that matrix. Use subsetting sharks[..., ...] to find out how many 
# hammerhead sharks were in the water on day 3.
sharks[2, 3]

# In one command: When was a single individual of tiger or hammerhead sharks observed?
sharks == 1

# On which days were there more than 2 tigers and/or hammerheads counted?
sharks > 2

# When were there more hammerheads counted than tiger sharks?
sharks[2, ] > sharks[1, ]


## 03: Logical operators ####

# Is 12 smaller than 45 and greater than 24/3 ?
12 < 45 & 12 > 24/3

# Is 12 smaller than 45 and smaller than 24/3?
12 < 45 & 45 < 24/3

## Logical operators and vectors ##

# Are the counts of tiger sharks on the second day between 2 and 5 (exclusive)?
tiger[2] > 2  &  tiger[2] < 5

# What about hammerhead sharks (inclusive)?
hammerheads[2]  >=2  &  hammerheads[2]  <=5

# Are tiger shark sightings on day 6 smaller than 2 or larger than 5 (exclusive)?
tiger[6] < 2  |  tiger[6] > 5

## 04 Logical operators and matrices ####

# When was more than one tiger shark, but no hammerhead shark counted?
sharks[1, ] > 1  &  sharks[2, ] == 0 

# When were 2 or more specimen of both species counted simultaneouly?
sharks[1, ] >= 2  &  sharks[2, ] >= 2

# On which days were there 4 individuals of one or both species?
sharks[1, ] > 4  |  sharks[2, ] > 4

# For which species and days in the sharks matrix is the count between 3 (inclusive)
# and 5 (exclusive)?
sharks >= 3  &  sharks < 5

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
sharks5 <- sharks[ , 5]
sharks5

# Use that day 5 vector to create a new vector that is TRUE for counts below 2
# or above 4 (both inclusive). Again, print that vector to the console.
sharks5_logic <- sharks5 <= 2  |  sharks5 >= 4
sharks5_logic

# Using that vecor, count how often these particularly high or low counts
# occured on day 5. That means: use the sum() function to count the numbers
# of TRUE in the vector created above. The sum() function does that pretty
# much automatically.
sum(sharks5_logic)

# And now solve it all in one single line of code.
sum(sharks[ ,5] <= 2 | sharks[ ,5] >= 4)


## 05: Conditional execution ####

# Here is the standard >if  recepy:

#  if(condition) {
#  this_will_happen
#}

# Use it to write an if condition that prints out "Warm and sunny." if the 
# object "season" equal to "summer"
season <- 'summer'

# Add an else condition to that to print out "Cold and rainy." whenever the
# season is not summer. Then check the printout in the console when assigning
# different values to 'season', such as 'spring' or 'winter'.
# Also, think about what would happen when you delete the object 'season'
# prior to executing your if-else condition. And then try it out:
rm(season)
# Now, run your conditional statement.

# Congratulations! Your weather and shark expertise has made you the responsable
# for shark forecasts and warnings on Coder Island's favourite surfing beach!
# Write an if-statement that prints "Shark alert!" whenever shark_count is larger 0.
shark_count <- 2

# Add an else statement that prints "All calm." when this is not the case. Test
# it with multiple values of shark_count.

# Now add else if code that prints "Come see lots of sharks!" when shark_count
# exceeds 4 individuals. Again: Test it out with multiple values of shark_count.

# What's happening here? 
# Once R has found a condition to be TRUE and has executed the  corresponding
# expression, it will regard the set of statements as fullfilled and will 
# ignores the rest of the commands.
# Can you fix your set of conditional statements to account for that? A hint:
# "Shark alert!" should be printed out if shark_count is between 1 and 4.


# Imagine that you can predict a shark_probability_score based on weather
# observation, that is in particular temperature and wind speed.
# Write a control flow that compiled a shark_probability_score based on
# temperature and wind speed measurements, and prints the appropriate warning.
temperature <- 25
wind_speed  <- 8
# If either temperature or wind speed are above 22, set the shark_probability_score
# to half the sum of temperature and wind speed.
# Else, if both are below or equal to 18, shark_probability_score should be three
# times the sum of temperature and wind speed.
# In all other cases, shark_probability_score should be simply the sum of both.
# Make sure you test your control flow with multiple values for temperature and
# wind speed.


# Last but not least, it's time to build the automated warning system:
# If the shark_probability_score is lower 20, there is probably no sharks in
# the bay ("All calm!"). A touristically relevant amount of them ("Come see
# lots of sharks!") would probably be present if shark_probability_score
# exceeds 80. And if it is anywhere between: "Shark alert!". 


#############
##  Loops  ##
#############

## 01: while loops ####

# With the following recipe:
# >  while (condition) {
# >    expr
# >  }
# And the initial setting for the temperature in an experimental tank
aquarium_temperature <- 28
# code a while loop that prints out a warning ("Temperature too high!") and
# reduces the temperature in the tank by one degree when aquarium_temperature
# exceeds 25 degrees.

# Consider (and test out) what happens with your while loop if you would
# not include the temperature reduction statement.

# While a decrease of one degree through the temperature management system you
# have coded works well for slightly warmer waters, your tank system will run
# into serious trouble once the temperature exceeds 30 degrees. Thus, use if
# and else statementes inside the while loop to create the very behaviour you
# did before, but additionally have "Temperature critically high!" if it
# exceeds 30 degrees, and have temperature reduced by 3 degrees.
aquarium_temperature <- 37
# Mind the order of the execution in the if - else statements, bearing in mind
# that, other than a while loop, which is executed as long as the condition
# applies (is TRUE), if - else statements are executed and then quit as soon 
# as the first condition is fulfilled.

# Add a printout of the current temperature to the while loop. Use the paste 
# function for that:
paste0('Current temperature is ', aquarium_temperature, 'degrees.')

# Unfortunately, your lab's cooling system can only handle aquarium temperatures
# up to 40 degrees. If the tank arrives or exceeds that temperature, the cooling
# system might take damage if switched on. It is then better to sacrifice the
# individual aquarium rather than risking that the entire lab may break down.
# In your temperature management code, include a  > break  argument that shuts
# down the while loop if aquarium_temperature reaches or exceeds 40 degrees.

# Enter a warning printout (text up to you!) that is printed when temperature
# reaches or exceeds 40 degrees. That text should be printed before the loop breaks.


## 02: for loops ####

# Build a for loop that iterates over the names of the shark species in the 
# table  sharks  that was created earlier. For each species, have the name 
# printed.

# Add a break command that stops execution of the loop when the species name
# is "blacktip".


## 03: Nested for loops ####

# Here's the recipe of how a nested for loop works:
# > for (i in sequence1) {
# >   for (j in sequence2) {
# >     expression
# >   }
# > }
# This nested for loop is useful for multidimensional objects, such as a matrix.
# It will first iterate through the dimension in the inner part of the loop for
# all first elements of the dimension of the outer loop and then do the
# same for the second element of the dimension of the outer loop.
# No worries, that will get clearer once you apply a nested for loop.
# 
# For a subset of the sharks data
sharks_subset <- sharks[3:4, 1:3]
# that has 2 rows
nrow(sharks_subset)
# and 3 columns
ncol(sharks_subset)
# write a nested for loops which inner loop iterates over all
# columns (1:ncol(sharks_subset)) and which outer loops iterates over all 
# rows (1:nrow(sharks_subset)) that prints out the respective shark counts.

# Well done. But that sequence of numbers is actually not too informative.
# Add a paste() command inside the printout command above to indicate the
# row (with index i) and column (with index j) that the observation stems from:
# The eventual format should be "xy sharks were recorded in row i and column j.".

# Let's make use of the conditional executions you have already mastered
# earlier: if and else. Use them to print out "Many sharks were recorded in
# row i and column j." if xy (that is, the count in row i and column j as
# selected through the nested for loop above) is larger than 4. In all other
# cases, leave the printout as it was ("xy sharks were recorded in row i and
# column j.")

# Excellent. Now add an if else command to print out "A single shark only was
# recorded for row i and column j.". Leave the above printouts as they were.
# Careful about the order of execution, bear in mind that if-else-statements
# will stop once the first condition is fulfilled.

# Master it: Instead of printing "row i" and "column j", make the printouts read
# like this "4 lemon sharks were recorded on day_2" or "6 bull sharks were
# recorded on day_2" !
# Use the functions
colnames(sharks_subset)  # and
rownames(sharks_subset)
# together with indexing
colnames(sharks_subset)[2]
# in your paste() or paste0() commands to create these printouts.

# Take a moment to be proud of your loop.

