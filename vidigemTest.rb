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

movies = {:Inception => inception, :AfterEarth => afterEarth, :Prometheus => prometheus, :Casablanca => casablanca, :MissingPieces => missingPieces, :Gladiator => gladiator, :TheDarkNightRises => theDarkKnightRises}
update = movies.keys

traits = { "mystery" => 2, "love" => 3, "betrayal" => 5 }

composites = {6=>"Inception"}
main = { :primes => traits, :movies => movies, :composites => composites}
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
		
		# Enters the dimension with a movies traits           ex: ["love", "betrayal"]
		mTraits = main[level][movie]
		
		# Creates an array of traits in prime forms           ex: [3, 5]
		primeList = mTraits.collect {|trait| retrieve.get_prime(main, trait)}
		
		# multiplies the primes to produce a composite.       ex: 3 * 5 = 15
		primeList.inject {|memo, n| memo * n}
  end
###########################################################################################################
	def composite_hash(main, movie, level = :composites)
		
		# cable = Hash[:siop, 100]

		# this gets the composite value
		cable = Hash[ get_composite(main, movie), ((movie.to_s.split /(?=[A-Z])/) * " ") ]
	end

	def auto(main, movies, hash = main[:composites])
		get = Calculate.new
		list = []
		for movie in movies
			updatedHash = get.composite_hash(main, movie)
			list << updatedHash
		end
		print list.inject { |all, h| all.merge(h) }
		
		
	end
	
#########################################################################################################
=begin
	def match(main, )
		this program takes a search number and checks it against a bunch of composites.
		if it finds a match, it returns a value.
	end
=end
end

calculate = Calculate.new
retrieve = Retrieve.new

puts retrieve.get_prime(main, "mystery")
puts "************************"
print retrieve.get_traits(main)
puts " "
puts " "


puts "#######################   testing get_composite  #############################"
print "the composite value of Casablanca is:    =>    "
puts calculate.get_composite(main, :Casablanca)
puts " "

puts "#######################   testing composite_hash  ##########################"

puts calculate.composite_hash(main, :Inception)

puts "#######################   testing auto  ##########################"
puts calculate.auto(main, update)






















