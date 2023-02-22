require './app'
require './preserve_label'

describe App do
  describe 'Testing App class' do
    # context '#add_book()' do

    # end
    before(:all) do
      @label = Label.new title: 'Gift', color: 'color'
    end
    context '#save_all()' do
      it 'should save labels to labels.json' do
        allow(File).to receive(:open).with('labels.json', 'wb') do |file|
          expect(file).to receive(:write).with(response.body)
        end
        # include PreserveLabels
        # App.new.save_all(save_labels(@label))
        # label_read = fetch_labels

        # expect(@label).to be eq(label_read)
      end
    end
  end
end
