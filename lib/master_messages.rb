class MasterMessage
  def welcome
    "Welcome to MASTERMIND"
  end

  def initial_instructions
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    "The computer will generate a series of four letters representing randomly assigned colors.
    \nThe four colors it will choose from are (r)ed, (g)reen, (b)lue, and (y)ellow.
    \nFor example, it will appear as 'yggb'.
    \nYou can guess the sequence by inputting a sequence of four letters.
    \nYou will receive feedback telling you how many colors are correct, and how many are in the right place.
    \nBased on the feedback you can guess again until you get the sequence correct."
  end

  def invalid_menu_choice
      "That is not a valid choice. Please select (p)lay, read the (i)nstructions, or (q)uit."
  end

  def invalid_guess_length(num_pins)
     "That is an invalid number of characters. Please choose #{num_pins} colors."
  end

  def invalid_colors(colors)
    "That is an invalid choice of color. Please choose from the following: #{colors}."
  end

  def make_guess
    "Guess again!"
  end

  def feedback(secret_pins, input, correct_colors, correct_pin_places, guesses)
    puts "Solution: #{secret_pins}. You guessed #{input}. You have #{correct_colors} of the correct elements with #{correct_pin_places} in the correct positions.\nYou've taken #{guesses} guess(es)."
  end

  def choose_level
    "Which level would you like to play?
    \n(b)eginner with four pins and four colors
    \n(i)ntermediate with six pins and five colors
    \n(a)dvanced with eight pins and six colors"
  end

  def game_instructions(level, pin_num, colors)
    "I have generated a #{level} sequence with #{pin_num} elements made up of:
    \n#{colors}.
    \nUse (q)uit at any time to end the game.
    \nWhat's your guess?"
  end

  def congrats(input, guesses, final_time, final_time2)
    "Congratulations you win! You guessed the sequence #{input} with #{guesses} guesses in #{final_time} minutes, #{final_time2} seconds.
    \nDo you want to (p)lay again or (q)uit?"
  end

end
