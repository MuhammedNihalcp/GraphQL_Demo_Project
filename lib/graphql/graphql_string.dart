String readRepositoriesCountry = r"""
  query GetContinent($code:ID!){
  continent(code : $code){
    name
    code
    countries{
       code
      name
     languages{
      name
    }
      capital
      currency
      phone
      states{
        name
      }
    }
  }
}	

""";

String readRepositoriesProduct = r"""
  query GetProduct{
  products(first: 5, channel: "default-channel") {
    edges {
      node {
        id
        name
       description
        productType{
          name
        }
        thumbnail{
          url
        }
      }
    }
  }
}

""";
