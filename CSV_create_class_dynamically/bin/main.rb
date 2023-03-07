require 'csv'
require_relative '../lib/dynamic_class.rb'
require_relative '../lib/read_data.rb'

csv_file =  Dir.glob("bin/*.csv")[0]
file_name = File.basename(csv_file, '.*')
data = ReadData.from_csv(csv_file)
dynamic_class = DynamicClass.new(data, file_name)
dynamic_class.create_class_instance
# p = Persons.new(name:"Anuj",age:22,city:"lko")
p = Persons.new
p.name = "Anuj"
p.age = 22
p.city = "lucknow"
p Persons.objects



