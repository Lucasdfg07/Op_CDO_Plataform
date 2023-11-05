require 'rails_helper'

RSpec.describe LessonClass, type: :model do
  let(:lesson_class) do
    LessonClass.create(
      title: 'test',
      description: 'test',
    )
  end

  context 'valid payload' do
    it 'return success' do
      result = lesson_class.save
      expect(result).to be_truthy
    end
  end

  context 'invalid payload' do
    context 'with invalid title' do
      before do
        lesson_class.title = 'Invalid Title' * 20
      end

      it 'return falsey' do
        result = lesson_class.save
        expect(result).to be_falsey
      end
    end

    context 'with invalid description' do
      before do
        lesson_class.description = 'Invalid Description' * 25
      end

      it 'return falsey' do
        result = lesson_class.save
        expect(result).to be_falsey
      end
    end
  end
end
