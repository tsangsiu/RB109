=begin

Problem:
- Rules:
  - decode a song from a dubstep remix
  - one or more 'WUB' is added before or after a song
  - at least one 'WUB' is added between words
  - the original song doesn't contain 'WUB'
  - all words are in capital letters
- Input: string
- Output: sting

Examples:
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"

Data Structures:
- Input: string
- Intermediate: string
- Output: string

Algorithm:
- given a dubsteb remix,
  - replace all the 'WUB' to a single space
  - compress consecutive spaces
  - remove leading and trailing spaces
  - return the initial song

=end

# Code:

def song_decoder(remix)
  remix.gsub('WUB', ' ').squeeze(' ').strip
end

p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
