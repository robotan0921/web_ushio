#
# Title : parse.rb
#
# For UshioLab
# excel --> html
#
# Date : Apl.12, 2016
# Name : Takuro
#

require 'rubygems'
require 'roo'

readFile = 'html/publication/index.html'
writeFile = 'html/publication/index.html'

xlsx = Roo::Spreadsheet.open('./domestic.xlsx')

info = xlsx.sheet(0).row(2)
newlists = ""
# puts xlsx.sheet(0).last_row
for i in 2 .. xlsx.sheet(0).last_row
    info = xlsx.sheet(0).row(i)
    string = "<li>"
    string += "#{info[1]},"                                 # Author
    string += " ``#{info[2]},''"                            # Title
    string += " #{info[3]},"                                # BookTitle
    string += " (#{info[4]})," unless info[4].nil?          # For Short
    string += " vol. #{info[5]}," unless info[5].nil?       # Volume
    string += " no. #{info[6]}," unless info[6].nil?        # Number
    string += " pp. #{info[7]}," unless info[7].nil?        # Pages
    string += " #{info[8]}" unless info[8].nil?             # Location
    string += " #{info[9]}" unless info[9].nil?             # Month
    string += " #{info[10].to_i}." unless info[10].nil?     # Year
    string += "</li>\n\t\t\t"
    newlists << string
end

## Delete old lists (<li> ... </li>)
text = ""
flag = false
label = false
f = File.open(readFile,"r")
while line = f.gets 
    flag = true if line.include?('id="domestic2016"')
    if flag
        if label
            text << line.gsub(/<li>.*<\/li>/,"")
        else
            label = true if line.include?("<!--label for parse-->")
            text << line.gsub(/<!--label for parse-->/,"<!--label for parse-->\n\t\t\tconvert")
        end
        flag = false if line.include?("</ol>")
    else 
        text << line
    end
end
f.close

newtext = ""
## Add new lists (<li> ... </li>)
text.each_line do |line|
    # TODO: Windows:CR+LF MacOS:CR Linux:LF 
    newtext << line.gsub("convert", newlists) unless line.include?("\t\r\n")
end

f = File.open(writeFile,"w")
f.write newtext
f.close

