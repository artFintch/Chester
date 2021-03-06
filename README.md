Chester
=======

[![Swift Version](https://img.shields.io/badge/Swift-3.1-orange.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://www.apple.com/ru/ios)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](https://github.com/JanGorman/Chester/blob/master/LICENSE)

All details about original Chester [here](https://github.com/JanGorman/Chester). In this fork, I will change some pieces of code for my job. Seems to be our API team uses another specification of GraphQL [(php)](https://github.com/Youshido/GraphQL) 🤷🏻‍♂️

#### Added ability build query without fields. It just can be a subQuery:
```swift
let client = try QueryBuilder().from("client").with(fields: "cid")
let registrationQuery = try QueryBuilder()
	.from("registration")
	.with(Argument(key: "name", value: "iPhone 8"))
	.with(subQuery: client)
	.build()
print(registrationQuery)
```
```graphql
{
  registration(name: "iPhone 8") {
    client {
      cid
    }
  }
}
```
#### Added ability use on without fields:
```swift
let accounts = QueryBuilder().from("accounts").on("currency", "value")
let accountsQuery = try QueryBuilder()
	.from("list")
	.with(Argument(key: "cid", value: 1))
	.with(subQuery: accounts)
	.build()
print(accountsQuery)
```
```graphql
{
  list(cid: 1) {
    accounts {
      ... on currency, 
      ... on value
    }
  }
}
```
#### Added extension for flattening query string. Example for code above:
```swift
print(registrationQuery.flatQuery)
print(accountsQuery.flatQuery)
```
```graphql
{registration(name: "iPhone 8") {client {cid}}}
{list(cid: 1) {accounts {... on currency, ... on value}}}
```
#### Changed some syntax (hide external arguments name, ability to pass array as alternative for variadic functions, etc).
