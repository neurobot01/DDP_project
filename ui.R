# Define UI
shinyUI(fluidPage(
  titlePanel("Chick diets"),
  sidebarLayout(
    sidebarPanel(
      
      h2("Choose diets and time range:"),
      fluidRow(
         
        helpText("Select diet regimen & time range to see effects on weight.",
                 "(Diet regimen 1 is auto-selected as a baseline.)"),
         
        checkboxGroupInput("checkGroup",
                   label = "Choose any number of diet regimens",
                   choices = list("Diet 2" = 2,
                                  "Diet 3" = 3,
                                  "Diet 4" = 4)),
         
        sliderInput("slider",
                   label = "Time range:",
                   min = 1, max = 12, value = c(3, 10),
                   ticks = FALSE)
      )
    ),
    
    mainPanel(
      
      h3("Effect of diet on chick weight over time"),
      
      plotOutput("mainplot")
      
      )
  )
))