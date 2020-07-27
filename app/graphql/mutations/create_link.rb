module Mutations
 class CreateLink < BaseMutation
   argument :description, String, required: true
   argument :url, String, required: true

   field :link, Types::LinkType, null: false

   def resolve(description: nil, url: nil)
     link = 
        Link.create!(
         description: description,
         url: url,
         user: context[:current_user]
       ) 
     puts link
     {link: link}
   rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
   end
 end 
end
