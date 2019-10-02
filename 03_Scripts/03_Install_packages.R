
# -----------------------------------------------------------------------------
# Title: Install packages

# Description: Demonstration of how to install and load packages into R.
#  1) Install packages
#  2) More about packages
#  3) Update packages
#  4) Uninstall packages

# Author: Simon Knüsel

# Date: 2019-09-30
# -----------------------------------------------------------------------------


# 1) Install packages --------------------
install.packages("dplyr")

# Load package
library(dplyr) # after installation the packages have to be loaded to be available
?dplyr # learn more about the package


# 2) More about packages --------------------

# Press Ctrl + 7 to see the packages tab

.libPaths() # path to packages on disk

library() # list of all installed packages

search() # list of all currently loaded packages


# 3) Update packages --------------------
update.packages()
# if you are asked if you want to "Update?"
# answer with y (for yes) or n (for no) in the Console (pane at bottom left)

# or manually by clicking the "Update" button in the Packages tab,
# press Ctrl + 7 to see the packages tab


# 4) Uninstall packages --------------------
#remove.packages("dplyr") # uninstalls package from disk

#install.packages("dplyr") # simply rerun install.packages to reinstall the package


