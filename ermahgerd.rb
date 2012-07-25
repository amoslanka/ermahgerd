class Ermahgerd < Sinatra::Base

  get "/" do
    haml :index
  end

  post "/ternslert" do 
    translate_hash params
  end
  get  "/ternslert" do
    translate_hash params
  end
  post "/translate" do
    redirect "/ternslert"
  end
  get  "/translate" do
    redirect "/ternslert"
  end

  private 

  def translate_hash input_hash
    hash = {}
    input_hash.each_pair do |key, value|
      if value.is_a?(String)
        hash[key] = translate(value)
      end
    end
    hash.to_json
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

end
