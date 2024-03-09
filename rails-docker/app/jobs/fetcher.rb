class Fetcher
  @queue = :fetch

  def self.perform
    FetchData.call
  end
end