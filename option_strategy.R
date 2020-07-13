#setup initial variables
UV <- 120
LV <- 50
step <- 1
pnl.matrix <- matrix(seq(LV, UV, 1))

#Enter Options:( 1=Put 1 /Call -1, Buy 1 /Sell -1, Strike, Premium)
opt1 <- c(1, 1, 70, 5)
opt2<- c(1, 1, 85, 2)

#This is the function that evaluates the option value
opt_val <- function(x, y1, y2, y3, y4) {
  if (y1 == 1) {
    if (y2 == 1) {
      if (x < y3) {
        y3 - x - y4
        
      }
      else{
        -y4
      }
    }
    else{
      if (x < y3) {
        x - y3 + y4
      }
      else{
        y4
      }
    }
  }
  else if (y1 == -1) {
    if (y2 == 1) {
      if (x < y3) {
        -y4
      }
      else{
        x - y3 - y4
      }
    }
    else if (y2 == -1) {
      if (x < y3) {
        y4
      }
      else{
        y3 - x + y4
      }
      
      
    }
  }
}

opt.matrix <-
  matrix(
    nrow = 0,
    ncol = 4,
    byrow = TRUE
  )
opt.matrix<-rbind(opt.matrix, opt1)
opt.matrix<-rbind(opt.matrix, opt2)

for (i in 1:nrow(opt.matrix)) {
  pnl.matrix <-
    cbind(pnl.matrix, as.numeric(
      lapply(
        pnl.matrix[, 1],
        opt_val,
        y1 = opt.matrix[i, 1],
        y2 = opt.matrix[i, 2],
        y3 = opt.matrix[i, 3],
        y4 = opt.matrix[i, 4]
      )
    ))
}



pnl.matrix <-
  cbind(pnl.matrix, rowSums(cbind(pnl.matrix[, 2], pnl.matrix[, 3])))



par(bg="grey98")

plot(
  pnl.matrix[, 1],
  pnl.matrix[, ncol(pnl.matrix)],
  xlab = "Close Price",
  ylab = "Profit/Loss",
  ylim = c(-20, 20),
  pch = 19,
  col = 2,
  main = "Profit and Loss"
)


points(
  pnl.matrix[, 1],
  pnl.matrix[, 3],
  pch = 21,
  col = 3
)

points(
  pnl.matrix[, 1],
  pnl.matrix[, 2],
  pch = 22,
  col = 4
)

legend(
  "bottom",
  legend = c("Total PnL", "Option 1", "Option 2"),
  col = c(2, 4, 3),
  pch = c(19, 22, 21),
  bty = "n",
  pt.cex = 2,
  cex = 1,
  text.col = "black",
  horiz = T ,
  inset = .001
)

abline(h = 0)