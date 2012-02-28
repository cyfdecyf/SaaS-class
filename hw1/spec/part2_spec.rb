require_relative '../part2.rb'

describe 'rps_game_winner' do
	it "return the winner's name and strategy" do
		game = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
		rps_game_winner(game).should == ["Dave", "S"]
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
