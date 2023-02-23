require 'json'
require 'date'

module PreserveAuthors
  def save_authors(authors)
    authors_arr = []
    authors_path = 'authors.json'

    return unless File.exist?(authors_path)

    authors.map do |author|
      authors_arr << { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end

    File.write(authors_path, JSON.pretty_generate(authors_arr))
  end

  def fetch_authors
    data = []
    authors_path = 'authors.json'

    return data if File.zero?(authors_path)

    JSON.parse(File.read(authors_path)).each do |author|
      data << Author.new(id: author['id'], last_name: author['last_name'],
                         first_name: author['first_name'])
    end

    data
  end
end
