# irish-elections

An open source database of information on all Irish political candidates, 
including their social media presence, for the 2016 general election. The database will be 
available publicly for citizens to access information about candidates seeking their vote 
and an open source API will help news organizations, universities and others to build tools 
and to build stories around the election debate.

### Seeding the database

DO NOT seed the database after 20th November as this will overwrite changes made by journalists
in the mean time.

Perform the intial seed:

```
bin/rake db:seed
```
