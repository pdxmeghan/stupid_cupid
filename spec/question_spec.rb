require 'rails_helper'

describe Question do
  it {should validate_presence_of :content}
  it {should validate_presence_of :title}
  it {should have_many :answers}
  it {should belong_to :user}
  it {should have_one :favorite}
end
