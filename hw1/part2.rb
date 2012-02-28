class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2

  # The winning strategy is only greater than the losing strategy 1
  # For 0 - 2, see comment below
	strage_val = { 'p' => 0, 's' => 1,  'r' => 2 }

	v1, v2 = game[0][1].downcase, game[1][1].downcase
	v1, v2 = strage_val[v1], strage_val[v2]
	raise NoSuchStrategyError if v1 == nil or v2 == nil

  # Trick on using remainder for negative number
  # there exists an integer q such that a = qd + r, where |q| < |r|
  # Remainder definition from wikipedia: If a and d are integers, with d non-
  # zero, then a remainder is an integer r such that a = qd + r for some
  # integer q, and with |r| < |d|.
  # This holds for negative numbers.
  # So -1 % 3 = 2 because -1 = (-1)*3 + 2
  # So -2 % 3 = 1 because -2 = (-1)*3 + 1
	winner = v1 == v2 ? 0 : ((v1 - v2) % 3 - 1)
	game[winner]
end
