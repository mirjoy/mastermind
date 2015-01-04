class MasterMessage
  def welcome
    "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    "The computer will generate a series of four letters representing randomly assigned colors.
    \nThe four colors it will choose from are (r)ed, (g)reen, (b)lue, and (y)ellow.
    \nFor example, it will appear as 'yggb'.
    \nYou can guess the sequence by inputting a sequence of four letters.
    \nYou will receive feedback telling you how many colors are correct, and how many are in the right place.
    \nBased on the feedback you can guess again until you get the sequence correct.
    \nWould you like to (p)lay or (q)uit?"
  end

  def invalid_guess_length
     "That is an invalid number of characters. Please choose 4 colors."
  end

  def invalid_colors
    "That is an invalid choice of color. Please choose (r)ed,(g)reen, (b)lue, or (y)ellow."
  end

  def make_guess
    "Guess again!"
  end

  def game_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.
    \nWhat's your guess?"
  end

end
