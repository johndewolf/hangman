#!/usr/bin/env ruby

word_bank = "water"
chances_remaining = 10
letters_to_guess = word_bank.split(//)
hidden_letters = word_bank.gsub(/[a-z]/, "_")
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
    return answer.index(guess)
  else
    return false
  end
end

input =

until chances_remaining == 0 || letters_to_guess == []
  puts hidden_letters

  puts "Guess a single letter (a-z) or the entire word: "
  input = gets.chomp.downcase

  while valid?(input) == false
    puts "Invalid guess, please try again"
    input = gets.chomp.downcase
  end

  if input.length > 1
    if whole_word(word_bank, input) == true
      puts "Congrats you won"
    else
      puts "You lose"
    end
  else
      if single_letter(word_bank, input)
        letters_to_guess.delete(input)
        hidden_letters[(single_letter(word_bank, input))] = input
        puts "You guess the letter #{input} correctly"
        puts "You have #{chances_remaining}"
      else
        puts "Sorry no #{input}'s found"
        chances_remaining -= 1
        puts "You have #{chances_remaining} chances remaining"
      end
  end

  if letters_to_guess == []
    puts "You win!"
  end
end



