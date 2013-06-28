=begin
Mystery:
	AfterEarth
	Prometheus
	Inception
Love:
	Inception
	MissingPieces
	Casablanca
Betrayal:
	Casablanca
	Gladiator
	TheDarkKnightRises
=end

inception = [ "love", "mystery" ]
afterEarth = ["mystery"]
prometheus = ["mystery"]
casablanca = ["love", "betrayal"]
missingPieces = ["love"]
gladiator = ["betrayal"]
theDarkKnightRises = ["betrayal"]

movies = {:Inception => inception, :AfterMath => afterEarth, :Prometheus => prometheus, :Casablanca => casablanca, :MissingPieces => missingPieces, :Gladiator => gladiator, :TheDarkNigghtRises => theDarkKnightRises}

traits = { "mystery" => 2, "love" => 3, "betrayal" => 5 }

main = { :primes => traits, :movies => movies}
class Retrieve
=begin
This class is used to retrieve data from hash tables and arrays.
=end
	def get_prime(main, trait, level=:primes)
	    # returns the prime value of an attribute
		main[level][trait]
	end

	def get_traits(main, level = :primes)
		# gets all the traits in database
		main[:primes].keys
	end 
end

class Calculate	
=begin
This class is used to make the various calculations necessary throughout the program.
=end
	def get_composite(main, movie, level = :movies)
		retrieve = Retrieve.new
		
		# Enters the dimension with a movies traits
		mTraits = main[level][movie]
		
		# Creates an array of traits in prime forms
		primeList = mTraits.collect {|trait| retrieve.get_prime(main, trait)}
		
		# multiplies the primes to produce a composite.
		primeList.inject {|memo, n| memo * n}
	end
end

calculate = Calculate.new
retrieve = Retrieve.new

puts retrieve.get_prime(main, "mystery")

print retrieve.get_traits(main)
puts " "

puts calculate.get_composite(main, :Casablanca)





















