# R/helpers.R
# Do NOT export this function

check_valid_input <- function(choices) {
  valid_moves <- c("rock", "paper", "scissors")
  if (!is.character(choices) || !all(choices %in% valid_moves)) {
    stop("Invalid input. Please choose only 'rock', 'paper', or 'scissors'.")
  }
}

get_computer_moves <- function(user_choices, strategy) {
  n <- length(user_choices)
  moves <- c("rock", "paper", "scissors")
  
  if (strategy == "random") {
    return(sample(moves, n, replace = TRUE))
  } else if (strategy == "always_rock") {
    return(rep("rock", n))
  } else if (strategy == "copycat") {
    # Strategy depending on previous user choice
    if (n == 1) {
      return(sample(moves, 1))
    }
    # Computer plays random first, then copies user's previous move
    first_move <- sample(moves, 1)
    return(c(first_move, user_choices[-n]))
  } else {
    stop("Unknown strategy. Try 'random', 'always_rock', or 'copycat'.")
  }
}

decide_winner <- function(user, computer) {
  # Vectorized operation
  ifelse(user == computer, "draw",
         ifelse((user == "rock" & computer == "scissors") |
                (user == "paper" & computer == "rock") |
                (user == "scissors" & computer == "paper"), "win", "lose"))
}