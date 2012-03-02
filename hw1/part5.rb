class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s # make sure it's a string
		attr_reader attr_name # create the attribute's getter
		attr_reader attr_name+"_history" # create bar_history getter
		class_eval %Q{
			def #{attr_name}=(val)
				@#{attr_name} = val
				@#{attr_name}_history = [nil] unless @#{attr_name}_history
				@#{attr_name}_history << val
			end
		}
	end
end