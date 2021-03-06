PositionStack <- proto(Position, {

  adjust <- function(., data, scales) {
    if (empty(data)) return(data.frame())
    
    if (is.null(data$ymax) && is.null(data$y)) {
      message("Missing y and ymax in position = 'stack'. ", 
        "Maybe you want position = 'identity'?")
      return(data)
    }

    if (!is.null(data$ymin) && !all(data$ymin == 0)) 
      warning("Stacking not well defined when ymin != 0", call. = FALSE)

    collide(data, .$width, .$my_name(), pos_stack)
  }  
  
  objname <- "stack"
  desc <- "Stack overlapping objects on top of one another"
  icon <- function(.) {
    y <- c(0.5, 0.8)
    rectGrob(0.5, c(0.5, 0.8), width=0.4, height=c(0.5, 0.3), gp=gpar(col="grey60", fill=c("#804070", "#668040")), vjust=1)
  }
  examples <- function(.) {
    # Stacking is the default behaviour for most area plots:
    ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) + geom_bar()
      
    ggplot(diamonds, aes(price)) + geom_histogram(binwidth=500)
    ggplot(diamonds, aes(price, fill = cut)) + geom_histogram(binwidth=500)
    
    # Stacking is also useful for time series
    data.set <- data.frame(
      Time = c(rep(1, 4),rep(2, 4), rep(3, 4), rep(4, 4)),
      Type = rep(c('a', 'b', 'c', 'd'), 4),
      Value = rpois(16, 10)
    )
    
    qplot(Time, Value, data = data.set, fill = Type, geom = "area")
    # If you want to stack lines, you need to say so:
    qplot(Time, Value, data = data.set, colour = Type, geom = "line")
    qplot(Time, Value, data = data.set, colour = Type, geom = "line",
      position = "stack")
    # But realise that this makes it *much* harder to compare individual
    # trends
  }
})