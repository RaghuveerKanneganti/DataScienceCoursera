library(shiny)

shinyUI(fluidPage(
    titlePanel("Image Processing"),
    hr(),
    sidebarLayout(
        
        sidebarPanel(sliderInput("brightness", label = h5("Adjust Brightness"), min = -1, max = 1, value = 0, step = 0.1),
                     sliderInput("contrast", label = h5("Adjust Contrast"), min = 0, max = 2, value = 1, step = 0.1),
                     sliderInput("gamma", label = h5("Gamma Correction"), min = 0, max = 2, value = 1, step = 0.1),
                     actionButton("go","Apply Changes and Run!"),
                     h5("Process Completed @:"),
                     verbatimTextOutput("value")
                     ),
            
        mainPanel(
            tabsetPanel(
                tabPanel("Image",
                         fluidRow(selectInput("filenames", "Select image:", sort.int(list.files("./www/",pattern = '^*')))),
                         fluidRow(imageOutput("myImage"))),
                         #fluidRow(h4("Processed Image")),
                         #fluidRow(imageOutput("myImage2"))),
                tabPanel("Instructions",
                         p("This tool can be used to adjust for color brightness,contrast, and gamma correction
                         of images that are pre-saved in the tool . To use the tool:"),
p("1. Select the image from the drop down menu under the 'Image' tab"),
p("2. Use the sliders in the side bar to change for image Brightness, Contrast and Gamma correction values"),
p("3. Click on 'Apply Changes and Run!' button to start applying changes"),
p("The process completed time will be updated in the text box. Please note that the time shown is the time where the shiny server is located")
                         
)
))
)
))

                
                         