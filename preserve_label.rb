require 'json'
require 'date'

module Preservelabels
  def save_labels(labels)
    labels_arr = []
    labels_path = 'labels.json'

    return unless File.exist?(labels_path)

    labels.map do |label|
      labels_arr << { id: label.id, title: label.title, color: label.color }
    end

    File.write(labels_path, JSON.pretty_generate(labels_arr))
  end

  def fetch_labels
    data = []
    labels_path = 'labels.json'

    return data if File.zero?(labels_path)

    JSON.parse(File.read(labels_path)).each do |label|
      data << Label.new(id: label['id'], color: label['color'],
                        title: label['title'])
    end

    data
  end
end
