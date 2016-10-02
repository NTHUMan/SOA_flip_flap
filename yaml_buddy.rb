require 'yaml'
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  	# take_tsv: converts a String with TSV data into @data
  	# parameter: tsv - a String in TSV format
  	def take_yaml(yaml)
      @data = Array.new
  		@data = YAML::load(yaml)
  	end

  	def to_yaml
  		return data.to_yaml
  	end
end