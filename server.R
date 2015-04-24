data(ChickWeight, package="datasets")

all_means <- matrix(
  sapply(split(ChickWeight$weight, list(ChickWeight$Diet, ChickWeight$Time)), 
         function(x) mean(x)), 
  nrow=4, 
  ncol=12)

colors <- list("black", "red", "green", "blue")
groupNames <- list("Group 1", "Group 2", "Group 3", "Group 4")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$mainplot <- renderPlot({
    
    plot(all_means[1,],
         type="n",
         xaxt="n",
         ylim=c(min(all_means),max(all_means)),
         xlab="Time",
         ylab="Weight")
    axis(1, at=seq(1,12),label=c(0,2,4,6,8,10,12,14,16,18,20,21))
    
    groups <- c(1, as.numeric(input$checkGroup))
    
    for(group in groups) {
      
      lines(input$slider[1]:input$slider[2],
            all_means[group, input$slider[1]:input$slider[2]], 
            col = colors[[group]],
            xaxt="n",
            type="b")
      
    }
    
    useNames <- groupNames[groups]
    
    legend("topleft",
           legend=useNames,
           col=groups,
           lty=1,
           pch=1)
          
  })
  
})