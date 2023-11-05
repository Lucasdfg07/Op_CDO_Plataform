require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:lesson_class) { create(:lesson_class) }

  let(:lesson) do
    Lesson.new(
      lesson_class_id: lesson_class.id,
      title: 'Test Title',
    )
  end

  context 'valid payload' do
    it 'return success' do
      result = lesson.save
      expect(result).to be_truthy
    end
  end

  context 'invalid payload' do
    context 'with invalid title' do
      before do
        lesson.title = 'Invalid Title' * 20
      end

      it 'return falsey' do
        result = lesson.save
        expect(result).to be_falsey
      end
    end
  end
end
