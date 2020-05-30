# frozen_string_literal: true

RSpec.describe Musixmatch do
  let(:api_key) { 'your_api_key' }

  it 'has a version number' do
    musixmatch = Musixmatch.new(api_key)
    expect(musixmatch.version).not_to be nil
  end

  it 'has an api_version' do
    musixmatch = Musixmatch.new(api_key)
    expect(musixmatch.api_version).to eq '1.1'
  end
end
