

##learning workflowr
#https://cran.r-project.org/web/packages/workflowr/vignettes/wflow-01-getting-started.html

#check for workflowr package
library("workflowr")

# Configure Git (only need to do once per computer)
# - wflow_git_config(user.name = "fstclair", user.email = "fstclair@villanova.edu")

# Start a new workflowr project
#wflow_start("learning_workflowr") #naming the new project


# Build the site
wflow_build()

# Customize your site!
#   1. Edit the R Markdown files in analysis/
#   2. Edit the theme and layout in analysis/_site.yml
#   3. Add new or copy existing R Markdown files to analysis/

# Preview your changes
wflow_build("analysis/*Rmd")

#to view the site without first building any files
wflow_view()

#view the status of the workflowr project
wflow_status()

#publish 3 unp rmd files
##"The first argument to wflow_publish() is a character vector of the R Markdown files to publish 4. The second is a message that will be recorded by the version control system Git when it commits (i.e. saves a snapshot of) these files. The more informative the commit message the better (so that future you knows what you were trying to accomplish)."
wflow_publish(c("analysis/index.Rmd", "analysis/about.Rmd", "analysis/license.Rmd"),
              "Publish the initial files for learning_workflowr")

#view the status of the workflowr project -- it is now up to date
wflow_status()

#put your code on GitHub so that it can serve your website online
wflow_use_github("fstclair") #need username


#now send all files to github
wflow_git_push(dry_run = TRUE) #Using 'dry_run = TRUE' previews what the function will do, remove this argument to actually push to GitHub

#removing dry run
wflow_git_push()
# Please enter your username (Esc to cancel): fstclair
# Error: Push failed for unknown reason.
#
# The error message from git2r::push() was:
#
#   Error in 'git2r_push': too many redirects or authentication replays
#
# These sorts of errors are difficult to troubleshoot. You can search for similar
# errors on the git2r GitHub repository for advice on how to fix it.
#
# Alternatively, if you have Git installed on your machine, the easiest solution
# is to instead run `git push` in the terminal. This is equivalent to
# wflow_git_push(). Specifically, copy-paste the following in the terminal:
#
#   git push -u origin master

#### to fix problem above: run 'git push -u origin master' in terminal and restart R, manually push

## now have a website, lets add data

wflow_open("analysis/third-analysis.Rmd")

#opening the index and adding a link to view results on intro page Click on this [link](first-analysis.html) to see my results.
wflow_open("analysis/index.Rmd")

wflow_open("analysis/presentations.Rmd")

#view the status of the workflowr project
wflow_status()

wflow_publish(c("analysis/index.Rmd", "analysis/third-analysis.Rmd"),
              "Add my third analysis") #publish unp

wflow_status() #up to date

#commit push


## --------------------
# Notes on 2.22 ------
# - adding more into workflowr


wflow_open("about.Rmd")


# Preview your changes
wflow_build("analysis/*Rmd")
wflow_publish("analysis/*Rmd", #asterisk is a wildcard nd publish anything in Rmd file type
           "Publish about page and all pages")


wflow_git_push()

wflow_git_commit(all=TRUE)


wflow_open("analysis/fourth-analysis.Rmd")

wflow_git_commit("docs/assets/*.png")

# creating a new file so i can add pictures

dir.create("docs/assets")

wflow_open("analysis/second-analysis.Rmd")

wflow_open("analysis/abstract.Rmd")



# grouped violin plot

#install.packages("hrbrthemes")
#install.packages("viridis")
library(ggplot2)
library(dplyr)
library(forcats)
library(hrbrthemes)
library(viridis)


data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/10_OneNumSevCatSubgroupsSevObs.csv", header=T, sep=",") %>%
  mutate(tip = round(tip/total_bill*100, 1))


data %>%
  mutate(day = fct_reorder(day, tip)) %>%
  mutate(day = factor(day, levels=c("Thur", "Fri", "Sat", "Sun"))) %>%
  ggplot(aes(fill=sex, y=tip, x=day)) +
  geom_violin(position="dodge", alpha=0.5, outlier.colour="transparent") +
  scale_fill_viridis(discrete=T, name="") +
  theme_ipsum()  +
  xlab("") +
  ylab("Tip (%)") +
  ylim(0,40)





?workflowr
