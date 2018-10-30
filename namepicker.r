x <- read.csv2("eaglesNameList.txt", header = FALSE, sep = ",")

doer <- "q"

print("Welcome to a thing that does a thing so I don't have to do a thing for this thing")

doer <- readline("Would you like an Eagle's name? (y/n): ")

if (doer[1] == "y") {
  while(doer == "y"){
    index <- sample(1:length(x), 1)
    print("The lucky person is:")
    print(x[index])
    
    doer <- readline(prompt = "Would you like another one? (y/n): ")
  }
} else if(doer[1] == "n") {
  print("Later Gator!")
} else {
  print("Invalid input. Please restart the program. Goodbye.")
}