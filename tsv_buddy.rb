require 'yaml'
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  	# take_tsv: converts a String with TSV data into @data
  	# parameter: tsv - a String in TSV format
  	def take_tsv(tsv)
  		@hashName = Array.new
		@data = Array.new
  		tsvSplits = tsv.split("\n")
  		initHashName(tsvSplits[0])
  		tsvSplits.shift
  		transferToHashArray(tsvSplits)
  	end

  	def initHashName(totalName)
  		totalName.split("\t").map { |name|
  			@hashName.push(name)
  		}
  	end

  	def transferToHashArray(total)
  		total.each do |data|
  			part = data.split("\t")
  			hash = createHash(part)
			@data.push(hash)
  		end
  	end

  	def createHash(part)
  		iter = 0
		hash = Hash.new()
		@hashName.each do |name|
			hash[name] = part[iter]
			iter+=1
		end
		return hash
  	end

  	# to_tsv: converts @data into tsv string
	# returns: String in TSV format
	def to_tsv
		str = getName
		@data.each do |element|
			str+=handleEach(element)
			str+="\n"
		end
		return str
	end

	def getName
		name = Array.new
		@data[0].each do |key, value|
			name.push(key)
		end
		return nameStr(name)
	end

	def nameStr(name)
		str = String.new(name[0])
		i = 1
		while i < name.length do
			str+=("\t"+name[i])
			i+=1
		end
		return str+"\n"
	end

	def handleEach(element)
		flag = 1
		str = String.new
		element.each do |key, value|
			if flag == 1
				str+=value
				flag = 0
			else
				str+=("\t"+value)
			end
		end
		return str
	end
end
