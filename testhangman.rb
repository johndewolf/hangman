#!/usr/bin/env ruby

word_bank = ["television",
             "ubiquitous",
             "annoying",
             "extrapolate",
             "refactor",
]
correct_answer = word_bank.sample
chances_remaining = 10
letters_to_guess = correct_answer.split(//)
@hidden_letters = correct_answer.gsub(/[a-z]/, "_")
incorrect_guess = []

def word_display(answer)
  x = answer.length
  puts "_" * x
end

def valid?(guess)
  !!guess.match(/[a-z?]/)
end

def whole_word(answer, guess)
  if answer == guess
    puts "Congrats"
  else
    puts "You lose"
  end
  exit
end

def single_letter(answer, guess)
  if answer.include?(guess)
    starting_loc = answer.index(guess)
    answer.count(guess).times do
      occurances = answer.index(guess, starting_loc)
      @hidden_letters[occurances] = guess
      starting_loc += 1
    end

  else
    return false
  end
end

input =

until chances_remaining == 0 || letters_to_guess == []
  puts "Word: #{@hidden_letters}"

  puts "Guess a single letter (a-z) or the entire word: "
  input = gets.chomp.downcase

  while valid?(input) == false
    puts "Invalid guess, please try again"
    input = gets.chomp.downcase
  end

  if input.length > 1
    if whole_word(correct_answer, input) == true
      puts "Congrats you won"
    else
      puts "You lose"
    end
  else
      if single_letter(correct_answer, input)
        letters_to_guess.delete(input)
        puts "Found #{correct_answer.count(input)} occurance(s) of the letter #{input}"
        puts "You have #{chances_remaining} chances remaining"
      else
        puts "Sorry no #{input}'s found"
        chances_remaining -= 1
        if chances_remaining == 0
          puts "You're out of chances, better luck next time."
        else
          puts "You have #{chances_remaining} chances remaining"
        end
      end
  end

  if letters_to_guess == []
    puts "You win!"
  end
end



