require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) do
    Category.new
  end

  context 'valid payload' do
    before do
      category.title = 'Title Example'
    end

    it 'returns success' do
      result = category.save!
      expect(result).to be_truthy
    end
  end

  context 'invalid payload' do
    it 'returns falsey' do
      result = category.save
      expect(result).to be_falsey
    end
  end
end
