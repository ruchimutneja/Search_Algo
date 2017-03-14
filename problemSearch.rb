require './page'
require './query'
require './Formatter'
require './WebPageKeywordType'


def processInput(string_line)
	keywords = string_line.split(" ")
	type_of_keyword = keywords.delete_at(0) 
	
	Page.new(keywords) if type_of_keyword == PAGE
	Query.new(keywords) if type_of_keyword == QUERY
end

def readInputFromFile
	File.open("input.txt", "r") do |f|
		f.each_line do |line|
			processInput(line)
		end
	end
end

def searchQueryInWebPage
	Query.all.each do |query_number,query_keyword|
		result  = Page.getWebPageHaving(query_number, query_keyword)
	 Formatter.format_output(result)
	end
end

readInputFromFile
searchQueryInWebPage