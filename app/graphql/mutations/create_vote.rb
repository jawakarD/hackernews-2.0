module Mutations
  class CreateVote < BaseMutation
    argument :link_id, ID, required: false

    field :vote, Types::VoteType, null: true

    def resolve(link_id: nil)
      vote = 
        Vote.create!(
          link: Link.find(link_id),
          user: context[:current_user]
        )

      {vote: vote}
    end
  end
end
