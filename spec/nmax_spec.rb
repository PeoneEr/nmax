require 'spec_helper'

RSpec.describe Nmax do
  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  it 'generate sample data' do
    Nmax::Generator.sample_data

    expect(File.exist?('sample_data')).to be true

    FileUtils.rm 'sample_data'
  end

  it 'should find n max ints' do
    output = Nmax::Reader.find_n_max(['1', '2', '3', '4', '5', '6', '7', '8', '9'], 2)

    expect(output).to eq([9, 8])
  end
end
