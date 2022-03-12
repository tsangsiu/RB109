=begin

Problem:
- Rules
  - given a URL as a string, parses out just the domain name
  - returns it as a string
- Input: string
- Output: string
- Questions:
  - What is a domain?
    - anything between www (if exist) and .com/.co, etc.

Examples:
p domain_name("http://github.com/carbonfive/raygun") == "github" 
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"
p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

Data Structures:
- Input: string
- Intermediate: array, split the url in parts
- Output: string

Algorithm:
- given a string
- remove the leading 'http://' or 'https://' if exist
- remove 'www.' if exist
- split the remaining string at '.'
- the first part would be the domain name
- retain that string

=end

# Code:

def domain_name(url)
  domain = url.split(/https?:\/\/|www\.|\./)
  domain.delete("")
  domain[0]
end

def domain_name(url)
  domain = url.gsub(/https?:\/\/|www\./, '')
  domain = domain.split('.')
  domain[0]
end

p domain_name("http://github.com/carbonfive/raygun") == "github" 
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"
p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
