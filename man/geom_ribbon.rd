\name{geom_ribbon}
\alias{geom_ribbon}
\alias{GeomRibbon}
\title{geom\_ribbon}
\description{Ribbons, y range with continuous x values}
\details{
This page describes geom\_ribbon, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom\_ribbon.  Aesthetics are mapped to variables in the data with the aes function: \code{geom\_ribbon(aes(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{ymin}: bottom (vertical minimum) (\strong{required}) 
  \item \code{ymax}: top (vertical maximum) (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{alpha}: transparency 
}
}
\usage{geom_ribbon(mapping = NULL, data = NULL, stat = "identity", position = "identity", 
    na.rm = FALSE, ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{stat}{statistic used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{na.rm}{NULL}
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_bar}}: Discrete intervals (bars)
  \item \code{\link{geom_linerange}}: Discrete intervals (lines)
  \item \code{\link{geom_polygon}}: General polygons
  \item \url{http://had.co.nz/ggplot2/geom_ribbon.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
# Generate data
huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
huron$decade <- round_any(huron$year, 10, floor)

h <- ggplot(huron, aes(x=year))

h + geom_ribbon(aes(ymin=0, ymax=level))
h + geom_area(aes(y = level))

# Add aesthetic mappings
h + geom_ribbon(aes(ymin=level-1, ymax=level+1))
h + geom_ribbon(aes(ymin=level-1, ymax=level+1)) + geom_line(aes(y=level))

# Take out some values in the middle for an example of NA handling
huron[huron$year > 1900 & huron$year < 1910, "level"] <- NA
h <- ggplot(huron, aes(x=year))
h + geom_ribbon(aes(ymin=level-1, ymax=level+1)) + geom_line(aes(y=level))

# Another data set, with multiple y's for each x
m <- ggplot(movies, aes(y=votes, x=year)) 
(m <- m + geom_point())

# The default summary isn't that useful
m + stat_summary(geom="ribbon", fun.ymin="min", fun.ymax="max")
m + stat_summary(geom="ribbon", fun.data="median_hilow")

# Use qplot instead
qplot(year, level, data=huron, geom=c("area", "line"))
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
