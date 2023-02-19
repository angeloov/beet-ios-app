// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllFriendsActivitiesQuery: GraphQLQuery {
  public static let operationName: String = "GetAllFriendsActivities"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetAllFriendsActivities {
        getAllFriendsActivities {
          __typename
          id
          songName
          artistName
          albumCoverURI
          friend {
            __typename
            username
            profilePicURI
          }
        }
      }
      """#
    ))

  public init() {}

  public struct Data: BeetAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { BeetAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getAllFriendsActivities", [GetAllFriendsActivity?].self),
    ] }

    public var getAllFriendsActivities: [GetAllFriendsActivity?] { __data["getAllFriendsActivities"] }

    /// GetAllFriendsActivity
    ///
    /// Parent Type: `FriendActivity`
    public struct GetAllFriendsActivity: BeetAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { BeetAPI.Objects.FriendActivity }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("id", BeetAPI.ID.self),
        .field("songName", String.self),
        .field("artistName", String.self),
        .field("albumCoverURI", String.self),
        .field("friend", Friend.self),
      ] }

      public var id: BeetAPI.ID { __data["id"] }
      public var songName: String { __data["songName"] }
      public var artistName: String { __data["artistName"] }
      public var albumCoverURI: String { __data["albumCoverURI"] }
      public var friend: Friend { __data["friend"] }

      /// GetAllFriendsActivity.Friend
      ///
      /// Parent Type: `Friend`
      public struct Friend: BeetAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { BeetAPI.Objects.Friend }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("username", String.self),
          .field("profilePicURI", String.self),
        ] }

        public var username: String { __data["username"] }
        public var profilePicURI: String { __data["profilePicURI"] }
      }
    }
  }
}
