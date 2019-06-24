
class PigLatinizer

  def vowel_list
    %(a e i o u)
  end

  def verb_word(word)
    word+="way"
  end

  def consonant_word(word)
    consonant=[]
    letter_array = word.split("") 
    while !vowel_list.include?(letter_array.first.downcase)
      consonant << letter_array.shift
    end
    letter_array.join("") << consonant.join("") << "ay"
  end

  def starts_with_verb?(word)
    vowel_list.include?(word[0].downcase)
  end

  def process_word(word)
    if starts_with_verb?(word)
      verb_word(word)
    else
      consonant_word(word)
    end
  end

  def piglatinize(word)
    new_word=nil
    if word.split(" ").length == 1 
      new_word = process_word(word)
    else
      new_word = word.split(" ").collect { |w| process_word(w) }.join(" ")
    end
    new_word
  end

end