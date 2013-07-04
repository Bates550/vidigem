class Database
	@movies

end

class Movie
	attr_reader :movie_title, :traits

	def initialize(movie_title, traits)
		@movie_title = movie_title
		@traits = traits
	end
end

class Features
	def initialize
		@features = {:cocaine => 2, :gangsters => 3, :robbery => 5}
	end

	def getComposite(movietraits)
		return nil unless movietraits.class == Array
		composite = movietraits.inject(1) {|comp, trait| comp * @features[trait]} 
		return composite
	end
end

goodfellas = Movie.new("Goodfellas", [:cocaine, :gangsters, :robbery])

features = Features.new
puts features.getComposite(goodfellas.traits)



