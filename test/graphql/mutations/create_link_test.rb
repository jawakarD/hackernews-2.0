require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase

  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test "create a new link" do
   link = perform(
     url: 'https://howtographql.com',
     description: 'Learn graphql in every language'
   )

   assert link[:link].persisted?
   assert_equal link[:link].description, 'Learn graphql in every language'
   assert_equal link[:link].url, 'https://howtographql.com'
  end
  
end
