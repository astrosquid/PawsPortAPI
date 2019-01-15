require 'net/https'
require 'json'

dog_api_url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(dog_api_url)
json = JSON.parse(Net::HTTP.get(uri))

def clear_breeds
  Breed.destroy_all
end

def parse_dog_json(json)
  json.each do |breed|
    if breed[1].empty?
      Breed.create(name: breed[0].titleize)
    else 
      group = breed[0]
      breed[1].each do |specifier|
        Breed.create(name: "#{specifier} #{group}".titleize)
      end
    end
  end
end

json.each do |element| 
  if element[0] == 'message'
    clear_breeds
    parse_dog_json(element[1])
  end
end