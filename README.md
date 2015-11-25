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

#API ACCESS

*Currently this is open (e.g. no access tokens required) and read only

All end-points can deliver the data in 3 formats, JSON, CSV and XML.

To get all candidates, got to:
http://irish-elections.storyful.com/candidates.xml (for XML)
http://irish-elections.storyful.com/candidates.csv (for CSV format)
http://irish-elections.storyful.com/candidates.json (for JSON format)

You can narrow your results by constituency, e.g.
Constituency example:
http://irish-elections.storyful.com/constituencies/donegal/candidates.json

To  get a list of all constituencies, you can access this in the following way:
http://irish-elections.storyful.com/constituencies.json (replacing “.json” with CSV or XML where needed)

You can narrow your results by Political Party, e.g.
http://irish-elections.storyful.com//parties/fine-gael/candidates.json

To get a list of all parties:
http://irish-elections.storyful.com/parties.json (replacing “.json” with CSV or XML where needed)


You can search by candidates by name, using a “q=” operator, e.g.
http://irish-elections.storyful.com/candidates.json?q=john (replacing “.json” with CSV or XML where needed)
will give you a list of all candidates with “john” in their name
