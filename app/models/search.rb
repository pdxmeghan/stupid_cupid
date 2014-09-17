class Search < ActiveRecord::Base
  def self.find(query)
    Question.basic_search(query) + Answer.basic_search(query)
  end
end
