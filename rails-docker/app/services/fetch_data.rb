class FetchData
  URL = "https://jsonplaceholder.typicode.com/users/1/posts"

  def self.call
    new.call
  end

  def call
    response = Faraday.get(URL)
    if response.status == 200
      result = JSON.parse(response.body)
      result.each do |note|
        Note.create(title: note["title"], content: note["body"])
      end
    end
  end
end