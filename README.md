## Example queries

### links 
```graphql
{
  allLinks{
    id
    url
    description
    postedBy {
      id
      name
      email 
      votes {
        id
      }
    }
  }
}	
```

### Create link
```graphql
mutation {
  createLink(input: {url: "https://npmjs.com/graphql-tools", description: "Just following guide"}){
    link{
      id
      url
      description	
      postedBy {
        id
        name
      }
    }
  }
}
```

### Signup
```graphql
mutation{
  createUser(
    input: {
      name: "Jawakar", 
      authProvider: {
        credentials: {
          email: "jawakar2@gmail.com",
          password: "1233456"
        }	
  		},	
  	}
  ){
    user  {
      id
      name
      email
    }
  }
}
```

### Login
```graphql
mutation{
  signinUser(
    input: {
      credentials: {
        email: "jawakar2@gmail.com",
        password:"1233456"
      }
    }
  ){
    token
    user{
      id
      name
      email
    }
  }
}
```

### Vote for link
```graphql
mutation{
  createVote(input: {linkId: 14}){
    vote{
      id
      link {
        id
        url
        description
      },
      user {
        id
        name
        email
      }
    }
  }
}
```
