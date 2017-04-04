# 
#  Title: Makefile
#  Date	: 2016/04/22
#  Name	: Takuro
#

#  source file
SRC = html/publication/index.html

#  ruby
RUBY = /usr/bin/ruby
#  sed
SED = /usr/bin/sed


all:

journal:
	$(RUBY) parser_journal.rb
	$(SED) -i -e 's/\r//g' $(SRC)

international:
	$(RUBY) parser_international.rb
	$(SED) -i -e 's/\r//g' $(SRC)

domestic:
	$(RUBY) parser_domestic.rb
	$(SED) -i -e 's/\r//g' $(SRC)

