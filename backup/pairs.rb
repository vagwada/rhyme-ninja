#!/usr/bin/ruby

require 'cgi'
require 'net/http'
require 'uri'
require 'json'

cgi = CGI.new;
rhyme = cgi['rhyme'];
syn = cgi['syn'];

puts "Content-type: text/html\n\n";

puts "<html>
  <head>
  </head>
  <body>
<h2>RHYME NINJA</h2>"

if(rhyme != "" || syn != "")
  
if(rhyme == "smiley" && syn == "love")
    puts "<font size=80><bold>KYELI!</bold></font>";
else

  header = ""
  request = "https://api.datamuse.com/words?"
  if(rhyme != "")
    request += "rel_rhy=#{rhyme}&";
    if(header == "")
      header = "Sets of words that rhyme "
    else
      header += " that rhyme with "
    end
    header += "<b>#{rhyme}</b>"
  end
  if(syn != "")
    request += "ml=#{syn}&";
    if(header == "")
      header = "Synonyms of "
    else
      header += " with synonym "
    end
    header += "<b>#{syn}:</b>"
  end
  header += ":<br/><br/>"
  puts header
  #debug puts "#{request}<br/><br/>";

  uri = URI.parse(request);
  response = Net::HTTP.get_response(uri)

  results = JSON.parse(response.body());
  results.each { |result|
    word = result["word"];
    score = result["score"];
    numSyllables = result["numSyllables"]
    puts "#{word}<br/>";
  }
  puts "<br/><br/>";
end
end

# do it again
puts "<form action=/cgi-bin/rhyme.rb>
  Rhymes with:<br>
  <input type=text name=rhyme value=>
  <br>
  Synonym:<br>
  <input type=text name=syn value=>
  <br><br>
  <input type=submit value=Submit>
</form> 
<hr>
<center><font size=-2>Rhyme Ninja by <a href=\"http://pacesmith.com\">Pace Smith</a></font></center>
  </body>
</html>
";
