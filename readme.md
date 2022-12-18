# SUMMARY

# For my Database, Design, and Development class at Pratt in Fall 2022, 
# I worked in a group of 3 to develop a SQL database. 
# 
# SCENARIO FOR THE DATABASE
# The scenario we came up with was that the Posterville Design Museum was 
# opening up its poster archive to outsiders curious to come in and view 
# posters in their reading room. (Previously, this could only be done by 
# researchers on the museum's staff, and, therefore, they'd been using a 
# simple shared Google Sheet to keep track of everything. Now, they would 
# need a more robust database that could support cataloguing, object tracking, 
# and logging poster viewing requests.)
#
# WHAT USERS CAN DO WITH THIS DATABASE
# The purpose of the database is to allow museum admin to manage user requests  
# for viewing the posters in the reading room. It also allows admin to collect, 
# store, update, track, and search for poster data, including: 
# Posters’ title, dimensions, date created, creator and their role in creating 
# the poster, medium, printer and its location, country and language of origin, 
# file path to its image, copyright statement and holder, request status, location 
# in terms of whether it’s back in the archive stacks or it had been checked out 
# and is being viewed in the reading room
#
# The admin needs to be able to: 
# - Access the poster metadata (who made the poster, when, what printer, etc.)
# - Track the current location of the posters (reading room or stacks)
# - Receive a user’s poster viewing request and log that into the database for fulfillment (pull from stacks)
# - Show poster request statuses (“out”, “request logged”, “returned”, or “shelved”) 
# - Store, Search and Return Poster data by multiple data facets (e.g., “Show each poster 
# title and the name of its printer” or “Show the poster ID, title, and printer name of posters 
# printed in a certain country”
# - Store and view images of posters (via file path)
# - Update poster metadata
# - Add new poster acquisitions to the database
# 
# The attached SQL file includes the code for:
# 1) Creating the tables
# 2) Inserting data into the tables
# 3) Some SQL queries


