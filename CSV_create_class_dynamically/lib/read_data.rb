class ReadData
  def self.from_csv(csv_file)
    CSV.read(csv_file, headers: true)
  end
end
