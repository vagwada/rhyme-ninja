#!/usr/bin/env ruby

# Rhyming utilities for Rhyme Ninja
# Used both in preprocessing and at runtime

#
# stop words
#

STOP_WORDS_TRIVIAL = ["i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours", "yourself", "yourselves", "he", "him", "his", "himself", "she", "her", "hers", "herself", "it", "its", "itself", "they", "them", "their", "theirs", "themself", "themselves", "what", "which", "who", "whom", "this", "that", "these", "those", "am", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "having", "do", "does", "did", "doing", "a", "an", "the", "and", "but", "if", "or", "as", "of", "at", "by", "for", "with", "to", "from", "then", "so", "than", "i'd", "i've", "i'll", "we'd", "we've", "we'll", "you'd", "you've", "you'll", "he'd", "he'll", "she's", "she'd", "she'll", "it's", "it'd", "it'll", "they'd", "they've", "they'll", "that's", "that'd", "that've", "that'll", "what's", "what've", "what'll", "who's", "who'd", "who've", "who'll", "this'd", "this'll", "that's", "that'd", "that've", "that'll"] # added 's 'd 've 'll forms as appropriate

STOP_WORDS_RELATABLE = ["because", "until", "while", "about", "against", "between", "into", "through", "during", "before", "after", "above", "below", "up", "down", "in", "out", "on", "off", "over", "under", "again", "further", "once", "here", "there", "when", "where", "why", "how", "all", "any", "both", "each", "few", "more", "most", "other", "some", "such", "no", "nor", "not", "only", "own", "same", "too", "very", "can", "will", "just", "dont", "should", "now"] # from https://gist.github.com/sebleier/554280, removed "s" "t", added "themself", and changed "don" to "dont", separated out the ones that ought not show up as related words of anything

def stop_word?(word)
  return STOP_WORDS_TRIVIAL.include?(word) || STOP_WORDS_RELATABLE.include?(word)
end

def relatable_word?(word)
  return ! STOP_WORDS_TRIVIAL.include?(word)
end

#
# blacklist
#

$blacklist = nil
def blacklist()
  if $blacklist.nil?
    $blacklist = load_blacklist_as_array
  end
  return $blacklist
end

def blacklisted?(word)
  return blacklist.include?(word)
end

def load_blacklist_as_array
  if(File.exists?("blacklist.txt"))
     return IO.readlines("blacklist.txt", chomp: true)
  else
    return IO.readlines("dict/blacklist.txt", chomp: true)
  end
end

def delete_blacklisted_words_from_array(array)
  return array.reject { |word| blacklisted?(word) }
end

#
# spelling variants
#

$variants = nil
def variants()
  # hash: word -> [preferred_form alternate_form1 alternate_form2 ...]
  if $variants.nil?
    $variants = load_variants
  end
  return $variants
end

def preferred_form(word)
  forms = variants[word]
  if(forms)
    return forms[0]
  else
    return word
  end
end

def all_forms(word)
  forms = variants[word]
  if(forms)
    return forms
  else
    return [word]
  end
end

def load_variants_raw
  if(File.exists?("spelling_variants.txt"))
     return IO.readlines("spelling_variants.txt", chomp: true)
  else
    return IO.readlines("dict/spelling_variants.txt", chomp: true)
  end
end

def load_variants
  variants_array = load_variants_raw
  hash = Hash.new
  for line in variants_array
    if line =~ /\A[[:alpha:]]/ # ignore lines that start with comment characters, punctuation, or numbers
      all_forms = line.split
      for word in all_forms
        hash[word] = all_forms
      end
    end
  end
  return hash
end
    
#
# rhyme signature
#

def rhyme_signature_array(pron)
  # The rhyme signature is everything including and after the final most stressed vowel,
  # which is indicated in cmudict by a "1".
  # Some words don't have a 1, so we settle for the final secondarily-stressed vowel,
  # or failing that, the last vowel.
  #
  # input: [IH0 N S IH1 ZH AH0 N] # the pronunciation of 'incision'
  # output:        [IH  ZH AH  N] # the pronunciation of '-ision' with stress markers removed
  #
  # We remove the stress markers so that we can rhyme 'furs' [F ER1 Z] with 'yours(2)' [Y ER0 Z]
  # They will both have the rhyme signature [ER Z].
  rsig = Array.new
  pron.reverse.each { |syl|
    # we need to remove the numbers
    rsig.unshift(syl.tr("0-2", ""))
    if(syl.include?("1"))
      return rsig # we found the main stressed syllable, we can stop now
    end
  }  
  # huh? we made it all the way through without a 1. Fine, we'll settle for a secondarily-stressed syllable.
  rsig = Array.new # start over
  pron.reverse.each { |syl|
    rsig.unshift(syl.tr("0-2", ""))
    if(syl.include?("2"))
      return rsig # we found the secondarily-stressed syllable, we can stop now
    end
  }
  rsig = Array.new # start over one last time
  # I guess we'll have to settle for the last unstressed syllable
  pron.reverse.each { |syl|
    rsig.unshift(syl.tr("0-2", ""))
    if(syl.include?("0"))
      return rsig # we found the last-resort thing, we can stop now
    end
  }
  error pron
end

def rhyme_signature(pron)
  # this makes for a better hash key
  return rhyme_signature_array(pron).join(" ")
end

def lang(lang, en_string, es_string)
  case lang
  when "en"
    return en_string
  when "es"
    return es_string
  else
    abort "Unexpected language #{lang}"
  end
end
