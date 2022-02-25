-- inserting values in edtechtable

db.edtechtable.insertMany(
  [
     {
         student_fname : "Pursharth",
         student_lname : "Maheshwari",
         courses_enrolled:[
           {
               coursename:"operating system", sessions: 7, assignments: 9
           },
           {
               coursename:"Database", sessions: 5, assignments: 8
           },
           {
               coursename:"Python Programming", sessions: 6, assignments: 7
           }
         ]
     },
     
     {
         student_fname : "abcdefg",
         student_lname : "pqrstuv",
         courses_enrolled:[
           {
               coursename:"Node JS", sessions: 4, assignments: 2
           },
           {
               coursename:"React JS", sessions: 7, assignments: 8
           },
           {
               coursename:"Python Programming", sessions: 2, assignments: 6
           }
         ]
       }
  ]

)


-- fetching data from edtechtable:

  db.getCollection('edtechtable').find({})

  --updateOne to update fname :
  db.edtechtable.updateOne(
{_id:ObjectId("621857d1c2d3608a6a31f5c3")},{$set:{student_fname:"newname"}}
)

--adding field of loggedin to perform updateMany:
db.edtechtable.updateOne(
{_id:ObjectId("621857d1c2d3608a6a31f5c4")},{$set:{logged_in:"yes"}}
)

--logging out all users that are logged in using updatemany:
db.edtechtable.updateMany(
{logged_in:"yes"},{$set:{logout:"yes"}}
)

--to delete all entries in table:
db.edtechtable.deleteMany({})

