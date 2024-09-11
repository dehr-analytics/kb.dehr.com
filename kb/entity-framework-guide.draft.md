Title: Entity Framework Guide
Published: 01/31/2099
Tags:
   - Entity Framework
---

Here are some of my most frequent interactions with Entity Framework when working with code first approach.

Code first approach just basically means you create a number of class files that represent tables and the class properties represent table fields.  The relationships are defined by simply the names of the properties, i.e. a Person class can have ``CompanyId`` property and this would just mean that there's a relationship between a ``Company`` table and the Person.  This also implies that the table name is ``Company``, its primary key is ``Id``.

The type of the relationship is 1-to-many because the ``Company`` class doesn't have a ``PersonId`` field in it, so there could be many people related to a single company.

# Creating the Models

``TBD``

# Updating the Database from the Model Code

I generally use the Visual Studio package manager console to sync up the SQL database once the model changes are done.

1. Add-Migration [ChangeDescriptionWithoutSpaces]
2. Update-Database

