library(shiny)
require(png)
library(EBImage)

shinyServer(function(input, output, session) {
    
    update = eventReactive(input$go, {
        
        output$myImage = renderImage({
            Image <- readImage(file.path('./www',input$filenames))
            Image1 <- Image + input$brightness
            Image1 = Image1 * input$contrast
            Image1 = Image1 ^ input$gamma
            writeImage(Image1, 'processed.png', quality=95)
            
            list( src =  'processed.png', alt = "Processing...")},deleteFile = FALSE)
            as.character(strptime(Sys.time(), "%Y-%m-%d %H:%M:%S"))   
        
        })
           
    output$value <- renderText({update()}) 
})