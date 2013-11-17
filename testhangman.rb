#!/usr/bin/env ruby

word_bank = "watewr"
chances_remaining = 10
letters_to_guess = word_bank.split(//)
hidden_letters = word_bank.gsub(/[a-z]/, "_")
incorrect_guess = []
input =

def single_letter(answer, guess)
  x = answer.length
  y = -1
  positions_of_letter = []
  if answer.include?(guess)
    x.times do
    y += 1
    if positions_of_letter.include?(y) == true
    positions_of_letter << answer.index(guess, y)
    end
    test = positions_of_letter.uniq
    test.each{|z| puts z}
  end


  else
    return false
  end
end

puts single_letter(word_bank, "w")
