# R/play_rps.R

#' Play Rock, Paper, Scissors against the computer
#'
#' @description
#' This function allows the user to play multiple rounds of Rock, Paper, Scissors 
#' against different computer strategies.
#'
#' @param user_choices A character vector containing the user's choices. 
#'   Valid options are "rock", "paper", or "scissors".
#' @param strategy A character string specifying the computer's strategy. 
#'   Options are "random" (default), "always_rock", or "copycat".
#'
#' @return A character vector of the same length as `user_choices` containing
#'   the results: "win", "lose", or "draw".
#' @export
#'
#' @examples
#' play_rps(c("rock", "paper", "scissors"))
#' play_rps(c("rock", "rock", "paper"), strategy = "always_rock")
#' play_rps(c("rock", "paper", "scissors", "rock"), strategy = "copycat")
play_rps <- function(user_choices, strategy = "random") {
  
  # 1. Input validation
  check_valid_input(user_choices)
  
  # 2. Generate computer moves
  computer_choices <- get_computer_moves(user_choices, strategy)
  
  # 3. Determine results
  results <- decide_winner(user_choices, computer_choices)
  
  return(results)
}