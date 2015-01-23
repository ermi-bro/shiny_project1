
library(shiny)

# copy mtcars data as mtcars
# convert the following numeric variables into factors:
# cyl -- Number of cylinder
# am -- Transmission (0 = automatic, 1 = manual)
# gear -- Number of forward gears
# carb -- Number of carburetors

mtcars$cyl <- factor(mtcars$cyl,
                     levels=c(4,6,8),
                     labels=c("4 cyl","6 cyl","8 cyl"))

mtcars$gear <- factor(mtcars$gear,
                      levels=c(3,4,5), 
                      labels=c("3 gear","4 gear","5 gear"))

mtcars$am <- factor(mtcars$am,
                    levels=c(0,1), 
                    labels=c("automatic","manual"))

mtcars$carb <- factor(mtcars$carb,
                      levels=c(1,2,3,4,6,8), 
                      labels=c("1 carburetor","2 carburetors","3 carburetors",
                               "4 carburetors","6 carburetors","8 carburetors"))

# Define UI for dataset viewer application
shinyUI(fluidPage(
    
    # Application title.
    titlePanel("Exploring Motor Trend Car Road Tests Dataset"),
    
    # Sidebar with controls to select x and y axix variables 
    # are used as inputs for the plots. 
    # The plot also produced using row and column facet, The facets
    # are also provided as an imput using using dropdown menu.
    # Select row facet from variables that are available in 'Facet Row'
    # controls, select column facet from 'Facet Column' controls.
    sidebarLayout(
        sidebarPanel(
            # select variable that is used in x-axis
            selectInput('xcol', 'X Variable', names(mtcars[sapply(mtcars, is.numeric)])),
            # select variable that is used in y-axis
            selectInput('ycol', 'Y Variable', names(mtcars[sapply(mtcars, is.numeric)])),
            
            # select variable that is used in row facet
            selectInput('facet_row', 'Facet Row',
                        c(None='.', names(mtcars[sapply(mtcars, is.factor)]))),
            # select variable that is used in column facet
            selectInput('facet_col', 'Facet Column',
                        c(None='.', names(mtcars[sapply(mtcars, is.factor)]))),
            
            helpText("Note: The data was extracted from the 1974 Motor Trend US magazine,",
                     "and comprises fuel consumption and 10 aspects of automobile",
                     "design and performance for 32 automobiles (1973/74 models).")
        ),
        
        # The output is a plot, the input variables are selected in sidebar.
        # Note the use of the h4 function is to give title for the plot.
        mainPanel(
            h4("Plot"),
            plotOutput('plot1')
        )
    )
))

