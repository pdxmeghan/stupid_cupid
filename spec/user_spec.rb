require 'rails_helper'

describe User do
  it {should validate_presence_of :name}
  it {should validate_presence_of :password}
  it {should validate_uniqueness_of :name}
  it {should ensure_length_of(:name).is_at_most(10)}
end
