require 'nmax/version'

module Nmax
  class Generator
    def self.sample_data
      File.open('sample_data', 'w+') do |file|
        1000.times do
          arr = []
          r = Random.new

          1000.times do
            arr << r.rand(100_000)
          end

          file.write(arr.join(' '))
        end
      end
    end
  end

  class Reader
    def self.find_n_max(raw_data, n)
      data = []

      raw_data.each do |line|
        data << line.split.map(&:to_i)
      end

      data.flatten.uniq.sort.reverse.take(n)
    end
  end
end
