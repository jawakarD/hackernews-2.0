class Hackernews20Schema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
