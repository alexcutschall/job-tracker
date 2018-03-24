require "rails_helper"

describe JobComment, type: :model do
  describe "relationships" do
    it {should belong_to(:job)}
  end
end
