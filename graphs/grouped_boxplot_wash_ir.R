## EXAMPLE

# # library
# library(ggplot2)
#
# # create a data frame
# variety=rep(LETTERS[1:7], each=40)
# treatment=rep(c("high","low"),each=20)
# note=seq(1:280)+sample(1:150, 280, replace=T)
# data=data.frame(variety, treatment ,  note)
#
# # grouped boxplot
# ggplot(data, aes(x=variety, y=note, fill=treatment)) +
#   geom_boxplot()

#####
# I try

# library
# library(ggplot2)
#
# # read in .csv file
# #df <- read.csv("~/Desktop/Coding/r_examples/practice_plots/sfbw_w_aa_ir.csv")
#
# # create a data frame
# wash <- rep(LETTERS[1:5], each=50)
# treatment <- rep(c("BW","SF"),each=25)
# rosette <-
# data <- df(wash, treatment, rosettes)



# grouped boxplot
ggplot(df, aes(x=WASH, y=ROSETTES, fill=TREATMENT)) +
  geom_boxplot()

#reorder the x-axis groups
df$WASH <- factor(df$WASH, levels = c("START", "1", "2", "3", "4"))


#set the colors

colors <- c("coral", "goldenrod1")

#now make the graph
# Plot with reordered groups
ggplot(df, aes(x = WASH, y = ROSETTES, fill=TREATMENT)) +
  geom_boxplot() +
  labs(x = "Wash number",
       y = "Number of intact rosettes",
       fill = "Treatment") +
  scale_fill_manual(values = colors) +
  theme_classic()







