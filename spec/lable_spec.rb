require './lable'

describe Lable do 
  context "Testing Lable class" do
    it "create a lable with Title and color", positive: true do 
      lable = Lable.new title: 'Abc', color: 'Black'
      
      expect(lable).to have_attributes(title: 'Abc')
      expect(lable).to have_attributes(color: 'Black')
    end

    it 'should not create lable without Title or color', negative: true do
      expect {Lable.new 'Color'}.to raise_error(ArgumentError)
    end
  end
end