require_relative "board"

class Card
	def initialize(face_value)
		@face_up = false
		@face_value = face_value
	end

	def hide
		@face_up = false
	end

	def reveal
		@face_up = true
	end

	def flip
		if @face_up == false
			reveal
		else
			hide
		end
	end

	def to_s
		if @face_up
			"#{@face_value}"
		else
			nil
		end
	end

	def ==(previous_guess)
		to_s == previous_guess.to_s
	end
end
