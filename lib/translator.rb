# require modules here
require 'yaml'

def load_library(filepath)
  # code goes here
  library_hash = YAML.load_file(filepath)
  
  return_hash ={}
  return_hash["get_meaning"] = {}
  return_hash["get_emoticon"] = {}
  
  library_hash.each do |meaning, emoticon_arr|
      return_hash["get_meaning"][emoticon_arr[1]] = meaning
      return_hash["get_emoticon"][emoticon_arr[0]] = emoticon_arr[1]
  end
  
  return_hash
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
   loaded_hash = load_library(filepath)
   
   if loaded_hash["get_emoticon"][emoticon]
       return loaded_hash["get_emoticon"][emoticon]
   else
       return "Sorry, that emoticon was not found"
   end
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  loaded_hash = load_library(filepath)
  if loaded_hash["get_meaning"][emoticon]
      return loaded_hash["get_meaning"][emoticon]
  else
      return "Sorry, that emoticon was not found"
  end
end
