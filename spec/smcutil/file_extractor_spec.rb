require_relative '../spec_helper'

RSpec.describe SmcUtil::FileExtractor do
  before(:all) do
    file = SmcUtil::FileReader.parse(File.expand_path('../fixtures/flasher_base.smc', __dir__))

    @extractor = SmcUtil::FileExtractor.new file

    @output_dir = Dir.mktmpdir
    puts "Output Directory: #{@output_dir}"
    @extractor.extract_to @output_dir
  end

  it 'should create a header output file' do
    File.exists? File.join(@output_dir, 'header.bin')
  end

  it 'should create a signature output file' do
    File.exists? File.join(@output_dir, 'signature.bin')
  end

  it 'should create a binary file' do
    File.exists? File.join(@output_dir, 'output.bin')
  end
end