# Run set_board_size(N::Int) once you include go.jl

module AlphaGo
using CuArrays
using Flux
using Flux: crossentropy, back!, mse, @treelike
using StatsBase: Weights
using Printf: @sprintf 

struct IllegalMove <:Exception end
abstract type Position end
abstract type GameEnv end

struct PositionWithContext
  position::Position
  next_move
  result::Int
end

export MCTSPlayer, NeuralNet, pick_move, play_move!,
      initialize_game!, set_result!,
      should_resign, is_done, result, train!, selfplay,
      train, play, load_model, GoEnv, GomokuEnv, Position, all_legal_moves,
      ChessEnv, result


include("game/go/go.jl")
include("game/gomoku/gomoku.jl")
include("game/env.jl")
include("mcts.jl")
include("mcts_play.jl")
include("features.jl")
include("neural_net.jl")
include("selfplay.jl")
include("train.jl")
include("play.jl")


end #module

