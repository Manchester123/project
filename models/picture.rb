class Picture

	attr_accesor :title, :comment, :description, :date, :user, :imagepath
	tags=[]
  #sets=[]

  def initialize()

  end


	def add_tag(tag)
		@tags << tag	
  end

end
