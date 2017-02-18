#Blocipedia

##Overview
Wikis are a great way to collaborate on community-sourced content. Whether the wiki is for a hobby or work-related project, Blocipedia is a Ruby on Rails application that allows users to create public and private Markdown-based wikis.

 - User can **sign up** for a free account by providing a user name, password and email
 - User can **sign in and out** of Blocipedia
 - User with the standard accoutn can **create**, **read**, **update**, and **delete** public wikis
 - User has three rols: admin, standard, or premium
 - User can **upgrade** his/her account from a free to a paid plan
 - Premium user can **create** private wikis
 - User can **edit** wikis using Marddown synatax
 - Premuim user can **create** private wikis
 - Premuim user can **add** and **remove** collaborators for his/her private wikis


##Features
###Home Page

![screenshot](/screenshot/front page.PNG)

###Sign up
Blocipedia uses Devise gem for authentication. It sends users an email for confirmation.

![screenshot](/screenshot/signup.PNG)


###Sign in
Using Devise gem, user can sign in/out of the Blocipedia.

![screenshot](/screenshot/signin.PNG)

###Wikis
![screenshot](/screenshot/wikiss.PNG)

###Suscription
Blocipedia uses Pundit gem for authorization. To upgrade a user's role, Blocipedia uses Stripe to charge users before switching their account role from standard to premium. The price for upgrading to premium is 15 dollars.

![screenshot](/screenshot/suscription page.PNG)


###New Wiki
Wikis can be written using Markdown syntax provided by Redcarpet gem.

![screenshot](/screenshot/new_wiki.PNG)

###Collaborators
Blocipedia uses `Has Many Through` relationships for User, Collaborator and Wikis. Private wikis are only visible to admins, the wiki creator, or wiki collaborators. 

![screenshot](/screenshot/collaborator.PNG)
