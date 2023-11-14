require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:lesson_class) { create(:lesson_class) }
  let(:lesson) { create(:lesson) }
  let(:user) { create(:user) }

  let(:comment) do
    Comment.new(
      lesson_id: lesson.id,
      user_id: user.id,
      description: 'Description Test',
    )
  end

  context 'valid payload' do
    it 'returns success' do
      result = comment.save!
      expect(result).to be_truthy
    end
  end

  context 'invalid payload' do
    context 'with invalid description' do
      before do
        comment.description = 'Invalid Description' * 25
      end

      it 'returns falsey' do
        result = comment.save
        expect(result).to be_falsey
      end
    end
  end
end
