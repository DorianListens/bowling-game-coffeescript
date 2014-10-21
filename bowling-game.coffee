class Game

  rolls = {}
  currentRoll: 0

  roll: (pins) ->
    rolls[@currentRoll++] = pins

  score: ->
    theScore = 0
    frameIndex = 0
    for frame in [0...10]
      if isStrike(frameIndex)
        theScore += 10 + strikeBonus(frameIndex)
        frameIndex++
      else if isSpare(frameIndex)
        theScore += 10 + spareBonus(frameIndex)
        frameIndex += 2
      else 
        theScore += sumOfBallsInFrame(frameIndex)
        frameIndex += 2
    return theScore

  isSpare = (frameIndex) ->
    rolls[frameIndex] + rolls[frameIndex + 1] is 10

  isStrike = (frameIndex) ->
    rolls[frameIndex] is 10

  sumOfBallsInFrame = (frameIndex) ->
    rolls[frameIndex] + rolls[frameIndex+1]

  spareBonus = (frameIndex) ->
    rolls[frameIndex + 2]

  strikeBonus = (frameIndex) ->
    rolls[frameIndex + 1] + rolls[frameIndex + 2]

  reset: ->
    rolls = {}
    @currentRoll = 0

# window.Game = Game
