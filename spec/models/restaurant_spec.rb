require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'can not have a name with less than three characters' do
    restaurant = Restaurant.create name: 'Go'
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create name: 'Taloorkes'
    restaurant = Restaurant.create(name: 'Taloorkes')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
