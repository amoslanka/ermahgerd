# require 'CGI'

class Ermahgerd < Sinatra::Base

  get "/" do
    "Hello Bundler"
  end

  get "/translate/:string" do
    # content_type :json
    # translate(params[:string])
    ::CGI::unescape translate(params[:string])
    # "hi"
    # params[:string]
  end

  post "/translate" do
    hash = {}
    params.each_pair do |key, value|
      if value.is_a?(String)
        hash[key] = translate(value)
      end
    end
    hash.to_json
  end

end

def translate text

  text.upcase!
  text.gsub!(/[AEIOUY]r(?! )/i, 'E');
  text.gsub!(/AA/i, 'A');
  text.gsub!(/EE/i, 'E');
  text.gsub!(/II/i, 'I');
  text.gsub!(/OO/i, 'O');
  text.gsub!(/UU/i, 'U');
  text.gsub!(/YY/i, 'Y');
  text.gsub!(/[AEIOUY]{2,}/i, 'E');
  text.gsub!(/[AEIOUY](?! )/i, 'ER');
  text.gsub!(/[Y]/i, 'ER');
  text.gsub!(/ERH/i, 'ER');
  text.gsub!(/ERR/i, 'ER');
  text.gsub!(/MER/i, 'MAH');
  text.gsub!('ERWERSERMAH', 'ERSUM');
  text.gsub!('ERWERSERME', 'ERSUM');
  text.gsub!('GERSERBERMPS', 'GERSBERMS');
  text.gsub!('MAHMAH', 'MERM');
  text.gsub!('MAHME', 'MERM');
  text
end