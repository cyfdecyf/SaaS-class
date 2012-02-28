require 'set'

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2

	strage_val = { 'p' => 0, 's' => 1,  'r' => 2 }


	v1, v2 = game[0][1].downcase, game[1][1].downcase
	v1, v2 = strage_val[v1], strage_val[v2]
	raise NoSuchStrategyError if v1 == nil or v2 == nil

	winner = (v1 - v2) % 3 - 1
	game[winner]
end
