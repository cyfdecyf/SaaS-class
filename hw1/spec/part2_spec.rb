require_relative '../part2.rb'

describe 'rps_game_winner' do
	it "returns the winner's name and strategy" do
		# Same strategy
		game = [ [ "Armando", "P" ], [ "Dave", "P" ] ]
		rps_game_winner(game).should == [ "Armando", "P" ]

		# Paper vs. Scissors
		game = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
		rps_game_winner(game).should == ["Dave", "S"]

    # Paper vs. Rock 
		game = [ [ "Armando", "P" ], [ "Dave", "R" ] ]
		rps_game_winner(game).should == [ "Armando", "P" ]

		# Scissors vs. Rock
		game = [ [ "Armando", "S" ], [ "Dave", "R" ] ]
		rps_game_winner(game).should == ["Dave", "R"]
	end

	it 'raise WrongNumberOfPlayersError excepion if game has more than 3 players' do
		game = [ [ "Armando", "P" ], [ "Dave", "S" ], ['CC', "Hello"] ]
		lambda { rps_game_winner(game) }.should raise_error(WrongNumberOfPlayersError)

		game = [ [ "Armando", "P" ] ]
		lambda { rps_game_winner(game) }.should raise_error(WrongNumberOfPlayersError)
	end

	it 'raise NoSuchStrategyError excepion if strategy is not P, R, or S' do
		game = [ [ "Armando", "G" ], [ "Dave", "S" ] ]
		lambda { rps_game_winner(game) }.should raise_error(NoSuchStrategyError)

		game = [ [ "Armando", "P" ], [ "Dave", "A" ] ]
		lambda { rps_game_winner(game) }.should raise_error(NoSuchStrategyError)

		game = [ [ "Armando", "B" ], [ "Dave", "A" ] ]
		lambda { rps_game_winner(game) }.should raise_error(NoSuchStrategyError)
	end
end

describe 'rps_tournament' do
	it 'return the winner of a tournament' do
		tour =
		[ # Dave R
			[ # Dave R
				[ ["Armando", "P"], ["Dave", "S"] ], # Dave S
				[ ["Richard", "R"], ["Michael", "S"] ], # Richard R
			],
			[ # Allen S
				[ ["Allen", "S"], ["Omer", "P"] ], # Allen S
				[ ["David E.", "R"], ["Richard X.", "P"] ] # Richard X. P
			]
		]
		rps_tournament_winner(tour).should == ["Richard", "R"]

		tour =
		[ # A P
			[ # A P
				[ # Dave R
					[ ["Armando", "P"], ["Dave", "S"] ],
					[ ["Richard", "R"], ["Michael", "S"] ],
				],
				[ # A P
					[ ["A", "P"], ["B", "p"] ], # A P
					[ ["C", "R"], ["D", "S"] ], # C R
				]
			],
			[ # Allen p
				[ ["Allen", "p"], ["Omer", "P"] ], # p
				[ ["David E.", "R"], ["Richard X.", "P"] ] # P
			]
		]
		rps_tournament_winner(tour).should == ["A", "P"]
	end
end