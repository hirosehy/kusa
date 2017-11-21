class Kusa
	#。、
	def kusa_1( message )
		message = message.gsub(/[。、]/, "ｗ" * rand( 2..6 ) )
		return message
	end

	def kusa_2( message )
		num = message.length
		kind = 6
		before_kind = 6
		
		i = 0
		loop do
			character = message[ i, 1 ]

			if character =~ /[一-龠々]/ then
				kind = 1
			elsif character =~ /\p{Katakana}/ then
				kind = 2
			elsif character =~ /\p{Hiragana}/ then
				kind = 3
			elsif character =~ /[１２３４５６７８９０]/ then
				kind = 4
			elsif character =~ /[（「：]/ then
				kind = 5
			elsif character == "" then
				break
			else
				kind = 6
			end

			if ( kind == 1 && before_kind == 3 ) || ( kind == 2 && before_kind == 3 ) || ( kind == 4 && before_kind =! 4 ) then
				rnd = rand( 2 .. 6 )
				message.insert( i, "ｗ" * rnd )
				i = i + rnd
			elsif kind == 5
				i = i + 1
			end
		
			before_kind = kind

			i = i + 1
		end

		message = message.gsub(/[。、]/, "ｗ" * rand( 2.. 6 ) )

		return message
	end
end
