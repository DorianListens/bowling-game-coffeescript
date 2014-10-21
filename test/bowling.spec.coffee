# Game = require '../bowling-game'
describe "Game", ->
  g = new Game()
  rollMany = (n, pins) ->
    for i in [0...n]
      g.roll(pins)

  rollSpare = () ->
    g.roll(5)
    g.roll(5)

  rollStrike = () ->
    g.roll(10)
 
  it "gutter game", ->
    g.reset()
    pins = 0
    n = 20
    rollMany(n, pins)
    expect(g.score()).toEqual 0

  it "all ones", ->
    g.reset()
    rollMany(20,1)
    expect(g.score()).toEqual 20

  it "one spare", ->
    g.reset()
    rollSpare()
    g.roll(3)
    rollMany(17,0)
    expect(g.score()).toEqual 16

  it "one strike", ->
    g.reset()
    rollStrike()
    g.roll(3)
    g.roll(4)
    rollMany(16, 0)
    expect(g.score()).toEqual 24

  it "perfect game", ->
    g.reset()
    rollMany(12, 10)
    expect(g.score()).toEqual 300