# README - Passwordless User Focused Website

This is an example of how to implement a passwordless web service using
OmniAuth of more secure websites to offload the need for password storage.
For cases where users don't wish to sign in using a social service, 
the passwordless gem takes care of sending out an email for them to log in.

The User's model is pretty bare at the moment. It simply contains
an email that's needed for Passwordless to do it's job in case the user
wants to sign in using their email. 

Some notes:
* In order to use Facebook or Google as authentication sources, add the following callback urls to the developer's portals respectively.
  * ``https://<server>/auth/google_oauth2/callback`` to ``https://console.developers.google.com/apis/credentials/oauthclient/``
  * ``https://<server>/auth/facebook/callback`` to ``https://developers.facebook.com/apps/<APPID>/fb-login/settings/``
* Also note, OmniAuth expects a file called omniauth.rb to be in config/initalizers, make it and client ids and secrets from facebook and google.
* SSL Should be enabled in the project. Example self signed cert and key are in config.
  * Run the server with the keys + cert in order to correctly form a SSL connection
  * eg. ``rails s puma -b 'ssl://127.0.0.1?key=config/server.key&cert=config/server.crt' -p 3000``