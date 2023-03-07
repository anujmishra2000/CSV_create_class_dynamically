class DynamicClass
  attr_reader :objects
  def initialize(data, class_name)
    @data = data
    @class_name = Object.const_set(class_name.capitalize, Class.new) 
    define_initialize
  end

  def define_initialize
    ob = @class_name.instance_variable_set(:@objects, []) 
    @class_name.define_method(:initialize) do |**hash|
      hash.each do |key,value|
        instance_variable_set("@#{key}", value)
      end
      ob << self
    end
    @class_name.define_singleton_method("objects") { instance_variable_get("@objects") }
  end

  def create_class_instance
    create_accessor_methods
    create_objects
  end

  def create_accessor_methods
    @data.headers.each { |header|
      @class_name.class_eval {attr_accessor header}
    }
  end

  def create_objects
    @data.each do |row|
      obj = @class_name.new
      @data.headers.each { |header| obj.public_send("#{header}=", row[header]) }
    end
  end
end