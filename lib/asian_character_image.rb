require 'rest_client'

module AsianCharacterImage
	class Word
		def initialize(word_unicode,fsize)
			@word_unicode = word_unicode
			@fsize = fsize
		end

		def image_url
			url = 'http://chinese.biodinfo.org/'\
             'ChineseCharactorWebService.asmx/'\
             'GetCharactorImageUrl?code=' + 
              URI.escape(@word_unicode) + '&fsize=' + URI.escape(@fsize)+ '&psd=1'
		    res = RestClient.get(url)
		    #res.gsub!(/\s/, ' ')
		    res=res.match(%r|<string.*>\s*(.+)\s*</string>|)
		    @image_url = res ? res[1].strip : nil 
		end
	end
end
