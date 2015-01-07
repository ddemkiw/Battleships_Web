class Ship
	attr_reader :size, :name
	attr_accessor :hits

	def initialize(size, *name)
		@size, @hits = size, 0
		@name = name
	end

	def hit!
		self.hits += 1
		true
	end

	def sunk?
		hits == size
	end

	def floating?
		!sunk?
	end

	def self.aircraft_carrier
		new(5, "Aircraft Carrier")
	end

	def self.battleship
		new(4,"Battleship")
	end

	def self.destroyer
		new(3, "Destroyer")
	end

	def self.submarine
		new(3, "Submarine")
	end

	def self.patrol_boat
		new(5,"Patrol Boat")
	end

end