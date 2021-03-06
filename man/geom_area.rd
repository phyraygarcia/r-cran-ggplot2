\name{geom_area}
\alias{geom_area}
\alias{GeomArea}
\title{geom\_area}
\description{Area plots}
\details{
An area plot is the continuous analog of a stacked bar chart (see geom\_bar), and can be used to show how composition of the whole varies over the range of x.  Choosing the order in which different components is stacked is very important, as it becomes increasing hard to see the individual pattern as you move up the stack.

An area plot is a special case of geom\_ribbon, where the minimum of the range is fixed to 0, and the position adjustment defaults to position\_stacked.

This page describes geom\_area, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom\_area.  Aesthetics are mapped to variables in the data with the aes function: \code{geom\_area(aes(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{alpha}: transparency 
}
}
\usage{geom_area(mapping = NULL, data = NULL, stat = "identity", position = "stack", 
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
  \item \url{http://had.co.nz/ggplot2/geom_area.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
# Examples to come
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
