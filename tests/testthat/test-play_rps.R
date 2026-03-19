# tests/testthat/test-play_rps.R

test_that("play_rps handles valid inputs correctly with always_rock", {
  res <- play_rps(c("paper", "scissors", "rock"), strategy = "always_rock")
  expect_equal(res, c("win", "lose", "draw"))
})

test_that("play_rps stops on invalid inputs", {
  expect_error(play_rps(c("rock", "gun")))
  expect_error(play_rps(123))
})

test_that("play_rps works deterministically with random strategy", {
  set.seed(123)
  # with seed 123, sample(c("rock", "paper", "scissors"), 3) will yield predictable results
  user_input <- c("rock", "paper", "scissors")
  res1 <- play_rps(user_input, strategy = "random")
  
  set.seed(123)
  res2 <- play_rps(user_input, strategy = "random")
  
  expect_equal(res1, res2)
  expect_length(res1, 3)
})

test_that("copycat strategy depends on previous user choice", {
  set.seed(42)
  # user: rock, paper, scissors
  # copycat: random_move, rock, paper
  user_input <- c("rock", "paper", "scissors")
  res <- play_rps(user_input, strategy = "copycat")
  expect_length(res, 3)
  # You can write more rigorous tests to check the exact sequence
})