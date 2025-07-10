class GrievanceQueries {
  static const String getAllGrievance = '''
     query GetAllGrievance {
          getAllGrievance {
              id
              title
              lastUpdatedAt
              caseNumber
              status
              createdAt
          }
      }
  ''';

  static const String getGrievanceById = '''
     query GetGrievanceById(\$id: ObjectID!) {
          getGrievanceById(input: {id: \$id }) {
            id
            title
            details
            createdAt
            lastUpdatedAt
            caseNumber
            status
            unit
            claim
            request
            favourOfSettlement
            memberIDs
            createdByID
            lastUpdatedByID
            assignedToID
            witnessIDs
            stewardID
            subStewardID
            steward {
                id
                firstName
                lastName
            }
            subSteward {
                id
                firstName
                lastName
            }
            members {
                id
                firstName
                lastName
            }
            documents {
                id
                name
                url
            }
            updates {
                updateID
                content
                updatedAt
                updatedBy {
                    id
                    firstName
                    lastName
                    profile {
                        imageURL
                    }
                }
            }
          }
      }
  ''';
}
