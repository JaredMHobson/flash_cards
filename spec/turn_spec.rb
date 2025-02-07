require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  let(:card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let(:turn) { Turn.new('Juneau', card) }

  it 'exists' do
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(turn.guess).to eq('Juneau')
  end

  it 'has a card' do
    expect(turn.card).to eq(card)
  end

  it 'tells you if guess is correct' do
    incorrect_guess = 'New York'
    turn = Turn.new(incorrect_guess, card)

    expect(turn.correct?).to eq(false)

    correct_guess = 'Juneau'
    turn = Turn.new(correct_guess, card)

    expect(turn.correct?).to eq(true)
  end

  it 'returns an appropriate String if correct or incorrect' do
    incorrect_guess = 'New York'
    turn = Turn.new(incorrect_guess, card)

    expect(turn.feedback).to eq('Incorrect!')

    correct_guess = 'Juneau'
    turn = Turn.new(correct_guess, card)

    expect(turn.feedback).to eq('Correct!')
  end
end