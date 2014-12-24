rankhospital <- function(state, outcome, num = "best")
{
  f <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if (!state %in% f$State) stop("invalid state")  
  if (outcome == "heart attack") outcome = "Heart.Attack"
  if (outcome == "heart failure") outcome = "Heart.Failure"
  if (outcome == "pneumonia") outcome = "Pneumonia"
  
  oc <- paste0("Hospital.30.Day.Death..Mortality..Rates.from.",outcome)
  idx <- match(oc, colnames(f))
  
  if (!oc %in% colnames(f)) stop("invalid outcome")  
  
  df <- f[which(f$State == state), ]
  df[, idx] <- as.numeric(df[, idx])
  df <- df[complete.cases(df[,idx]), ]
  df <- df[order(df[, idx], df[, 2]), ]
  
  if (num == "best") hosp <- df[1, 2]
  if (num == "worst") hosp <- df[nrow(df), 2]
  if (is.numeric(num))
  {
    if (num < nrow(df)) hosp <- df[num, 2]
    if (num > nrow(df)) hosp <- NA
  }
  
  print(hosp)
}

