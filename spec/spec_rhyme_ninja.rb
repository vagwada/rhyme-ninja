require_relative '../ninja'

# conditionalizes tests that we don't expect to work yet
OPTIMISTIC = false

NOT_WORKING = false; #don't edit this one

#
# rare?
# 

def oughta_be_common(word, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "'#{word}' oughta be common"
    it test_name do
      expect(rare?(word)).to eql(false), "'#{word}' oughta be common, but is rare, with frequency #{frequency(word)}"
    end
  end
end

def oughta_be_rare(word, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "'#{word}' oughta be rare"
    it test_name do
      expect(rare?(word)).to eql(true), "'#{word}' oughta be rare, but is common, with frequency #{frequency(word)}"
    end
  end
end

describe 'rarity' do
  context 'stop words' do
    oughta_be_common('a')
    oughta_be_common('be')
    oughta_be_common('in')
    oughta_be_common('me')
    oughta_be_common('i')
    oughta_be_common('you')
    oughta_be_common('to')
    oughta_be_common('of')
    oughta_be_common('at')
    oughta_be_common('he')
    oughta_be_common('she')
    oughta_be_common('they')
    oughta_be_common('their')
    oughta_be_common('theirs')
    oughta_be_common('his')
    oughta_be_common('hers')
    oughta_be_common('yours')
    oughta_be_common('my')
    oughta_be_common('about')
    oughta_be_common('because')
    oughta_be_common('and')
  end

  context 'obvious' do
    oughta_be_common('up')
    oughta_be_common('away')
    oughta_be_common('cat')
    oughta_be_common('alive')
    oughta_be_common("i've")
    oughta_be_common('next')
    oughta_be_common('around')
    oughta_be_common('flight')
  end

  context 'timely' do
    oughta_be_common('blog')
  end

  context 'rare' do
    oughta_be_rare('alam')
    oughta_be_rare('bahm')
    oughta_be_rare('beacham')
    oughta_be_rare('bram')
    oughta_be_rare('burcham')
    oughta_be_rare('camm')
    oughta_be_rare('cham')
    oughta_be_rare('dahm')
    oughta_be_rare('damm')
    oughta_be_rare('dirlam')
    oughta_be_rare('flam')
    oughta_be_rare('flamm')
    oughta_be_rare('frahm')
    oughta_be_rare('gahm')
    oughta_be_rare('gamm')
    oughta_be_rare('graeme')
    oughta_be_rare('gramm')
    oughta_be_rare('hahm')
    oughta_be_rare('hamm')
    oughta_be_rare('hamme')
    oughta_be_rare('kam')
    oughta_be_rare('kamm')
    oughta_be_rare('klamm')
    oughta_be_rare('kram')
    oughta_be_rare('kramm')
    oughta_be_rare('kramme')
    oughta_be_rare('kvam')
    oughta_be_rare('kvamme')
    oughta_be_rare('laflam')
    oughta_be_rare('laflamme')
    oughta_be_rare('lahm')
    oughta_be_rare('lambe')
    oughta_be_rare('lamm')
    oughta_be_rare('lamme')
    oughta_be_rare('mcclam')
    oughta_be_rare('mcham')
    oughta_be_rare('mclamb')
    oughta_be_rare('nahm')
    oughta_be_rare('nam')
    oughta_be_rare('pam')
    oughta_be_rare('panam')
    oughta_be_rare('pham')
    oughta_be_rare('plam')
    oughta_be_rare('quamme')
    oughta_be_rare('rahm')
    oughta_be_rare('ramm')
    oughta_be_rare('sahm')
    oughta_be_rare('schram')
    oughta_be_rare('schramm')
    oughta_be_rare('stam')
    oughta_be_rare('stamm')
    oughta_be_rare('stram')
    oughta_be_rare('t-lam')
    oughta_be_rare('tham')
    oughta_be_rare('vandam')
    oughta_be_rare('vandamme')
    oughta_be_rare('zahm')
    oughta_be_rare('sadat')
    oughta_be_rare('spratt')
    oughta_be_rare('arnatt')
    oughta_be_rare('balyeat')
    oughta_be_rare('batte')
    oughta_be_rare('bhatt')
    oughta_be_rare('biernat')
    oughta_be_rare('blatt')
    oughta_be_rare('bratt')
    oughta_be_rare('catt')
    oughta_be_rare('delatte')
    oughta_be_rare('deslatte')
    oughta_be_rare('elat')
    oughta_be_rare('flatt')
    oughta_be_rare('glatt')
    oughta_be_rare('hatt')
    oughta_be_rare('hnat')
    oughta_be_rare('inmarsat')
    oughta_be_rare('jagt')
    oughta_be_rare('katt')
    oughta_be_rare('klatt')
    oughta_be_rare('krat')
    oughta_be_rare('kratt')
    oughta_be_rare('labatt')
    oughta_be_rare('landsat')
    oughta_be_rare('mcnatt')
    oughta_be_rare('non-fat')
    oughta_be_rare('nonfat')
    oughta_be_rare('patt')
    oughta_be_rare('platt')
    oughta_be_rare('pratte')
    oughta_be_rare('prevatt')
    oughta_be_rare('prevatte')
    oughta_be_rare('ratte')
    oughta_be_rare('sarratt')
    oughta_be_rare('schadt')
    oughta_be_rare('shatt')
    oughta_be_rare('slaght')
    oughta_be_rare('tvsat')
  end
  
  context 'uncommon but not rare' do
    oughta_be_common('astray')
    oughta_be_common('everyday')
    oughta_be_common('faraway')
    oughta_be_common('halfway')
    oughta_be_common('risque')
    oughta_be_common('underway')
    oughta_be_common('renowned')
    oughta_be_common('newfound')
    oughta_be_common('shat')
    oughta_be_common('bra')
    oughta_be_common('daft')
    oughta_be_common('evict')
    oughta_be_common('flighty')
  end

  context 'arguable' do
    oughta_be_common('begat')
    oughta_be_common('nonfat')
    oughta_be_common('chez')
    oughta_be_common('cray')
    oughta_be_common('fey')
    oughta_be_common('francais')
    oughta_be_common('jose')
    oughta_be_common('kay')
    oughta_be_common('ole')
    oughta_be_common('one-way')
    oughta_be_common('passe')
    oughta_be_common('convex')
    oughta_be_common("tech's")
    oughta_be_common('megaplex')
    oughta_be_common('aground')
    oughta_be_common('inbound')
    oughta_be_common('unsound')
    oughta_be_common('hyperspace')
    oughta_be_common('apace')
    oughta_be_common('face-to-face')
  end
end


#
# rhymes
#

def oughta_rhyme(word1, word2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "'#{word1}' oughta rhyme with '#{word2}'"
    it test_name do
      expect(rhymes?(word1, word2)).to eql(true), "'#{word1}' (pronounced #{pronunciations(word1)}) oughta rhyme with '#{word2}' ((pronounced #{pronunciations(word2)}), but instead it only rhymes with #{find_rhyming_words(word1)}, and #{word2} only rhymes with #{find_rhyming_words(word2)}"
      expect(rhymes?(word2, word1)).to eql(true), "'#{word2}' (pronounced #{pronunciations(word2)}) oughta rhyme with '#{word1}' (pronounced #{pronunciations(word1)}), but instead it only rhymes with #{find_rhyming_words(word2)}, and #{word1} only rhymes with #{find_rhyming_words(word1)}"
    end
  end
end
                
def ought_not_rhyme(word1, word2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "'#{word1}' ought not rhyme with '#{word2}'"
    it test_name do
      expect(rhymes?(word1, word2)).to eql(false), "'#{word1}' (pronounced #{pronunciations(word1)}) ought not rhyme with '#{word2}' (pronounced #{pronunciations(word2)}), but it does, and it also rhymes with #{find_rhyming_words(word1)}"
      expect(rhymes?(word2, word1)).to eql(false), "'#{word2}' (pronounced #{pronunciations(word2)}) ought not rhyme with '#{word1}' (pronounced #{pronunciations(word1)}), but it does, and it also rhymes with #{find_rhyming_words(word2)}"
    end
  end
end

describe 'rhymes' do

  context 'no self-rhymes' do
    ought_not_rhyme 'red', 'red'
  end
  
  context 'basic' do
    ought_not_rhyme 'beer', 'wine'
    oughta_rhyme 'yum', 'plum'
    oughta_rhyme 'space', 'place'
    oughta_rhyme 'rhyme', 'crime'
    oughta_rhyme 'gay', 'hooray'
  end
  
  context 'tricky' do
    oughta_rhyme 'ear', 'beer' # used to fail because ear is [IY1 R] and beer is [B IH1 R]
    oughta_rhyme "we're", 'queer'
    ought_not_rhyme 'crime', "yum"
    ought_not_rhyme 'crime', "'em"
    ought_not_rhyme 'rhyme', "'em"
    oughta_rhyme 'station', 'nation'
    oughta_rhyme 'station', 'education'
    ought_not_rhyme 'station', 'cation' # it's pronounced "CAT-EYE-ON"
    ought_not_rhyme 'education', 'cation'
    ought_not_rhyme 'anion', 'onion' # it's pronounced "ANN-EYE-ON"
  end
  
  context 'perfect rhymes must rhyme the last primary-stressed syllable, not just the last syllable' do
    ought_not_rhyme 'station', 'shun'
    ought_not_rhyme 'under', 'fur'
    ought_not_rhyme 'tea', 'bounty'
  end

  context "you can't just add a prefix and call it a rhyme" do
    oughta_rhyme 'grape', 'ape' # gr- is not a prefix
    oughta_rhyme 'pot', 'spot' # s- is not a prefix
    oughta_rhyme 'under', 'plunder' # pl- is not a prefix
    ought_not_rhyme 'bone', 'trombone', NOT_WORKING # trom- is not a prefix... but this one is arguable
    
    ought_not_rhyme 'promising', 'unpromising'
    ought_not_rhyme 'ion', 'cation'
    
    oughta_rhyme 'able', 'cable'
    oughta_rhyme 'unable', 'cable'
    ought_not_rhyme 'able', 'unable', NOT_WORKING

    ought_not_rhyme 'traction', 'attraction', NOT_WORKING # arguable
    oughta_rhyme 'action', 'traction'
    oughta_rhyme 'action', 'attraction'

    oughta_rhyme 'ice', 'dice'
    oughta_rhyme 'ice', 'deice', NOT_WORKING # deice (de-ice) is not in cmudict
    ought_not_rhyme 'ice', 'deice', NOT_WORKING

    oughta_rhyme 'stand', 'strand'
    oughta_rhyme 'understand', 'strand'
    ought_not_rhyme 'stand', 'understand', NOT_WORKING
  end

  if(OPTIMISTIC)
  context "homophones ought not count as rhymes" do
    ought_not_rhyme 'adapter', 'adaptor'
    ought_not_rhyme 'blue', 'blew'
    ought_not_rhyme 'base', 'bass'
    ought_not_rhyme 'leader', 'lieder'
    ought_not_rhyme 'impostor', 'imposter'
    ought_not_rhyme 'lindsay', 'lindsey'
    ought_not_rhyme 'hanukkah', 'chanukah' # what if the initial sounds are different, though? Then how do we know to eliminate this?
  end
  end
  
  context 'profanity is allowed' do
    oughta_rhyme 'truck', 'fuck'
  end
  
  context 'slurs are forbidden' do
    ought_not_rhyme 'tipsy', 'gypsy'
    ought_not_rhyme 'fop', 'wop'
    ought_not_rhyme 'fops', 'wops'
  end
  
  context 'Limerick Heist' do
    oughta_rhyme 'heist', 'sliced'
    oughta_rhyme 'heist', 'iced'
    oughta_rhyme 'tons', 'funds', NOT_WORKING
  end

  context 'imperfect rhymes' do
    oughta_rhyme 'mushroom', 'doom', NOT_WORKING # no pronunciation for 'mushroom'
  end
  
  # context 'filter rare words' do
  # 'saddle' has a bunch of rare words
  # end
end

#
# related
#

def oughta_be_related(word1, word2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "'#{word1}' oughta be related to '#{word2}'"
    it test_name do
      expect(related?(word1, word2, false)).to eql(true), "Related words for '#{word1}' oughta include '#{word2}', but instead we just get #{find_related_words(word1)}"
    end
  end
end
  
def ought_not_be_related(word1, word2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "'#{word1}' ought not be related to '#{word2}'"
    it test_name do
      expect(related?(word1, word2, false)).to eql(false), "Related words for '#{word1}' ought not include '#{word2}'"
    end
  end
end
  
describe 'related' do
  
  context 'basic' do
    oughta_be_related 'meow', 'cat'
    oughta_be_related 'grave', 'death'
  end

  context 'reflexivity' do
    ought_not_be_related 'death', 'death'
  end

  context 'examples from the documentation' do
    oughta_be_related 'death', 'bled'
    oughta_be_related 'death', 'dead'
    oughta_be_related 'death', 'dread'
  end

  context 'slurs are forbidden' do
    ought_not_be_related 'gypsy', 'romanian'
    ought_not_be_related 'romanian', 'gypsy'
    ought_not_be_related 'gypsies', 'romanian'
    ought_not_be_related 'romanian', 'gypsies'
  end
  
  if(OPTIMISTIC)
  context 'pirate' do
    ought_not_be_related 'pirate', 'pew', NOT_WORKING
  end
  end

  context 'halloween' do
    ought_not_be_related 'halloween', 'ira', NOT_WORKING
    ought_not_be_related 'halloween', 'lindsay', NOT_WORKING
    ought_not_be_related 'halloween', 'lindsey', NOT_WORKING
    ought_not_be_related 'halloween', 'nicki', NOT_WORKING
    ought_not_be_related 'halloween', 'nikki', NOT_WORKING
    ought_not_be_related 'halloween', 'pauline', NOT_WORKING
  end
  
end

#
# set_related
#

def set_related_contains?(input, output1, output2)
  # Generate set_related rhymes for INPUT. Does one of them contain both OUTPUT1 and OUTPUT2?
  # e.g. 'pirate', 'handsome', 'ransom'
  for tuple in find_rhyming_tuples(input) do
    if(tuple.include?(output1) and tuple.include?(output2))
      return true
    end
  end
  return false
end

def set_related_oughta_contain(input, output1, output2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "set_related #{input} -> #{output1} / #{output2}"
    it test_name do
      expect(set_related_contains?(input, output1, output2)).to eql(true), "Set-related rhymes for '#{input}' oughta include '#{output1}' (pronounced #{pronunciations(output1)}) / '#{output2}' (pronounced #{pronunciations(output2)}) / ..., but instead we just get #{find_rhyming_tuples(input)}"
    end
  end
end

def set_related_ought_not_contain(input, output1, output2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "set_related #{input} !-> #{output1} / #{output2}"
    it test_name do
      expect(set_related_contains?(input, output1, output2)).to eql(false), "Set-related rhymes for '#{input}' ought not include '#{output1}' / '#{output2}' / ..."
    end
  end
end

describe 'set_related' do

  context 'examples from the documentation' do
    set_related_oughta_contain 'death', 'bled', 'dread'
    set_related_oughta_contain 'death', 'bled', 'dead'
    set_related_oughta_contain 'death', 'dead', 'dread'
  end
  
  context 'pirate' do
    set_related_oughta_contain 'pirate', 'cove', 'trove'
    set_related_oughta_contain 'pirate', 'handsome', 'ransom'
    set_related_oughta_contain 'pirate', 'french', 'wench'
    set_related_oughta_contain 'pirate', 'gang', 'hang'
    set_related_oughta_contain 'pirate', 'bold', 'gold'
    set_related_oughta_contain 'pirate', 'peg', 'leg'
    set_related_oughta_contain 'pirate', 'daring', 'swearing'
    set_related_oughta_contain 'pirate', 'hacker', 'cracker' # a different kind of pirate
    set_related_oughta_contain 'pirate', 'crew', 'tattoo'
    set_related_oughta_contain 'pirate', 'coast', 'ghost'
    set_related_oughta_contain 'pirate', 'loot', 'pursuit'
    set_related_oughta_contain 'pirate', 'buccaneer', 'commandeer'
    set_related_ought_not_contain 'pirate', 'eyes', 'seas' # via two pronunciations of 'reprise'
  end

  context 'halloween' do
    set_related_oughta_contain 'halloween', 'celebration', 'decoration'
    set_related_oughta_contain 'halloween', 'cider', 'spider'
    set_related_oughta_contain 'halloween', 'sheet', 'treat'
    set_related_oughta_contain 'halloween', 'bat', 'cat'
    set_related_oughta_contain 'halloween', 'fairy', 'scary'
    set_related_oughta_contain 'halloween', 'fright', 'night'
    set_related_ought_not_contain 'halloween', 'lindsay', 'lindsey', NOT_WORKING
    set_related_ought_not_contain 'halloween', 'cider', 'snyder', NOT_WORKING
    set_related_ought_not_contain 'halloween', 'day', 'ira', NOT_WORKING
  end

  context 'music' do
    set_related_oughta_contain 'music', 'baroque', 'folk'
    set_related_oughta_contain 'music', 'enjoys', 'noise'
    set_related_oughta_contain 'music', 'funk', 'punk'
    set_related_oughta_contain 'music', 'sing', 'swing'
    set_related_oughta_contain 'music', 'composition', 'musician', NOT_WORKING # bump up $datamuse_max
    set_related_oughta_contain 'music', 'clarinet', 'minuet', NOT_WORKING # bump up $datamuse_max
    set_related_oughta_contain 'music', 'accidental', 'instrumental', NOT_WORKING # bump up $datamuse_max
    set_related_oughta_contain 'music', 'sings', 'strings', NOT_WORKING # bump up $datamuse_max
    set_related_oughta_contain 'music', 'glissando', 'ritardando', NOT_WORKING
    set_related_oughta_contain 'music', 'viola', 'hemiola', NOT_WORKING
    set_related_oughta_contain 'music', 'overtone', 'xylophone', NOT_WORKING
    set_related_oughta_contain 'music', 'wave', 'rave', NOT_WORKING
    set_related_oughta_contain 'music', 'beat', 'repeat', NOT_WORKING
    set_related_oughta_contain 'music', 'flow', 'bow', NOT_WORKING
    set_related_oughta_contain 'music', 'guitar', 'rock star', NOT_WORKING
    set_related_oughta_contain 'music', 'jingle', 'single', NOT_WORKING # as in a hit single
    set_related_oughta_contain 'music', 'bar', 'repertoire', NOT_WORKING
    set_related_oughta_contain 'music', 'harp', 'sharp', NOT_WORKING
    set_related_oughta_contain 'music', 'show', 'arpeggio', NOT_WORKING # if we squish the stress
    set_related_oughta_contain 'music', 'mix', 'drumsticks', NOT_WORKING # if we squish the stress
    set_related_oughta_contain 'music', 'violin', 'mandolin', NOT_WORKING
    set_related_oughta_contain 'music', 'rest', 'expressed', NOT_WORKING
    set_related_oughta_contain 'music', 'lute', 'flute', NOT_WORKING
    set_related_oughta_contain 'music', 'fortissimo', 'pianissimo', NOT_WORKING
    set_related_ought_not_contain 'music', 'cello', 'solo'
    set_related_ought_not_contain 'music', 'cello', 'concerto'
    set_related_ought_not_contain 'music', 'solo', 'concerto'
    set_related_oughta_contain 'music', 'gong', 'song', NOT_WORKING
    set_related_oughta_contain 'music', 'duet', 'quartet', NOT_WORKING
    set_related_oughta_contain 'music', 'duet', 'quintet', NOT_WORKING
    it 'no proper subsets: we should get bone / intone / trombone, and not also get bone / intone' do
      bone_intone = ['bone', 'intone']
      bone_intone_trombone = ['bone', 'intone', 'trombone']
      tuples = find_rhyming_tuples('music')
      expect(tuples.include?(bone_intone_trombone)).to eql(true)
      expect(tuples.include?(bone_intone)).to eql(false)
    end
  end

  if(OPTIMISTIC)
  context 'imperfect' do
    # relax the stress:
    set_related_oughta_contain 'halloween', 'broom', 'costume'
    set_related_oughta_contain 'music', 'oboe', 'piano'
    set_related_oughta_contain 'music', 'cello', 'solo'
    set_related_oughta_contain 'music', 'cello', 'concerto'
    set_related_oughta_contain 'music', 'solo', 'concerto'
    # dwim a non-final consonant
    set_related_oughta_contain 'music', 'symphony', 'timpani'
  end
  end
  
end

#
# pair_related
#

def pair_related_contains?(input1, input2, output1, output2)
  # Generate pair_related rhymes for INPUT1 / INPUT2. Is one of them "OUTPUT1 / OUTPUT2"?
  target_pair = [output1, output2]
  find_rhyming_pairs(input1, input2).include? target_pair
end

def pair_related_oughta_contain(input1, input2, output1, output2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "pair_related #{input1} / #{input2} -> #{output1} / #{output2}"
    it test_name do
      expect(pair_related_contains?(input1, input2, output1, output2)).to eql(true), "Pair-related rhymes for '#{input1}' / '#{input2}' oughta include '#{output1}' (pronounced #{pronunciations(output1)}) / '#{output2}' (pronounced #{pronunciations(output2)}), but instead we just get #{find_rhyming_pairs(input1, input2)}"
    end
  end
end

def pair_related_ought_not_contain(input1, input2, output1, output2, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "pair_related #{input1} / #{input2} !-> #{output1} / #{output2}"
    it test_name do
      expect(pair_related_contains?(input1, input2, output1, output2)).to eql(false), "Pair-related rhymes for '#{input1}' / '#{input2}' ought not include '#{output1}' / '#{output2}'"
    end
  end
end

describe 'pair_related' do
  
  context 'examples from the documentation' do
    pair_related_oughta_contain 'crime', 'heaven', 'confessed', 'blessed'
  end
  
  context 'interactive fiction' do
    pair_related_oughta_contain 'interactive', 'fiction', 'exciting', 'writing'
  end

  context 'food evil' do
    pair_related_oughta_contain 'food', 'evil', 'chewed', 'rude'
    pair_related_oughta_contain 'food', 'evil', 'cuisine', 'mean'
    pair_related_oughta_contain 'food', 'evil', 'feed', 'greed'
    pair_related_oughta_contain 'food', 'evil', 'grain', 'pain'
    pair_related_oughta_contain 'food', 'evil', 'grain', 'bane'
    pair_related_oughta_contain 'food', 'evil', 'rice', 'vice'
    pair_related_oughta_contain 'food', 'evil', 'vegetarian', 'totalitarian'
    pair_related_oughta_contain 'food', 'evil', 'dinner', 'sinner'
    pair_related_oughta_contain 'food', 'evil', 'cake', 'rake', NOT_WORKING
    pair_related_oughta_contain 'food', 'evil', 'mushroom', 'doom', NOT_WORKING
    pair_related_oughta_contain 'food', 'evil', 'chips', 'apocalypse', NOT_WORKING
    pair_related_oughta_contain 'food', 'evil', 'seder', 'darth vader', NOT_WORKING
    pair_related_oughta_contain 'food', 'evil', 'sachertort', 'voldemort', NOT_WORKING
    pair_related_oughta_contain 'food', 'evil', 'bread', 'undead', NOT_WORKING
  end
  
  context 'food dark' do
    pair_related_oughta_contain 'food', 'dark', 'turkey', 'murky', NOT_WORKING
  end

end

#
# related_rhymes
#

def related_rhymes?(input_rhyme, input_related, output)
  # Generate words that rhyme with input_related and are related to input_related.
  # Is OUTPUT one of them?
  # e.g. 'please', 'cats', 'siamese'
  find_related_rhymes(input_rhyme, input_related).include?(output)
end

def related_rhymes_oughta_contain(input_rhyme, input_related, output, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "related_rhymes #{input_rhyme} + #{input_related} -> #{output}"
    it test_name do
      expect(related_rhymes?(input_rhyme, input_related, output)).to eql(true), "'#{output}' (pronounced #{pronunciations(output)}) oughta be one of the words that rhyme with '#{input_rhyme}' (pronounced #{pronunciations(input_rhyme)}) and is related to '#{input_related}'"
    end
  end
end

def related_rhymes_ought_not_contain(input_rhyme, input_related, output, is_working=true)
  if(is_working or OPTIMISTIC)
    test_name = "related_rhymes #{input_rhyme} + #{input_related} !-> #{output}"
    it test_name do
      expect(related_rhymes?(input_rhyme, input_related, output)).to eql(true), "'#{output}' (pronounced #{pronunciations(output)}) ought not one of the words that rhyme with '#{input_rhyme}' (pronounced #{pronunciations(input_rhyme)}) and is related to '#{input_related}'"
    end
  end
end

describe 'related_rhymes' do

  context 'examples from the documentation' do
    related_rhymes_oughta_contain 'please', 'cats', 'siamese'
  end

end