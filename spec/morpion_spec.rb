$:.unshift File.expand_path("./../../lib", __FILE__)
require 'morpion'

morpion = Morpion.new
describe 'the est_termine? method' do
  it 'should return false for these morpions' do
    morpion.ary_morpion = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    # puts morpion.est_termine?('X')
    expect(morpion.est_termine?('X')).to eq(false)
    expect(morpion.est_termine?('O')).to eq(false)
    morpion.ary_morpion = [["X", "O", "X"], ["O", "X", "O"], [" ", "O", " "]]
    expect(morpion.est_termine?('X')).to eq(false)
    expect(morpion.est_termine?('O')).to eq(false)
  end
  it 'should return true for these morpions, testing row' do
    morpion.ary_morpion = [["X", "X", "X"], [" ", " ", " "], [" ", " ", " "]]
    expect(morpion.est_termine?('X')).to eq(true)
    morpion.ary_morpion = [[" ", " ", " "], ["X", "X", "X"], [" ", " ", " "]]
    expect(morpion.est_termine?('X')).to eq(true)
    morpion.ary_morpion = [[" ", " ", " "], [" ", " ", " "], ["X", "X", "X"]]
    expect(morpion.est_termine?('X')).to eq(true)
  end
  it 'should return true for these morpions, testing columns' do
    morpion.ary_morpion = [["X", " ", " "], ["X", " ", " "], ["X", " ", " "]]
    expect(morpion.est_termine?('X')).to eq(true)
    morpion.ary_morpion = [[" ", "X", " "], [" ", "X", " "], [" ", "X", " "]]
    expect(morpion.est_termine?('X')).to eq(true)
    morpion.ary_morpion = [[" ", " ", "X"], [" ", " ", "X"], [" ", " ", "X"]]
    expect(morpion.est_termine?('X')).to eq(true)
  end
  it 'should return true for these morpions, testing diagonales' do
    morpion.ary_morpion = [["X", " ", " "], [" ", "X", " "], [" ", " ", "X"]]
    expect(morpion.est_termine?('X')).to eq(true)
    morpion.ary_morpion = [[" ", " ", "X"], [" ", "X", " "], ["X", " ", " "]]
    expect(morpion.est_termine?('X')).to eq(true)
  end
end